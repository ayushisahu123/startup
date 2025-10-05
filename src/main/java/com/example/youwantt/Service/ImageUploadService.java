package com.example.youwantt.Service;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ImageUploadService {

    @Autowired
    private Cloudinary cloudinary;


    private final JdbcTemplate jdbcTemplate;

    public ImageUploadService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> uploadImages(List<MultipartFile> files) throws IOException {
        List<String> urls = new ArrayList<>();
        for (MultipartFile file : files) {
            Map uploadResult = cloudinary.uploader().upload(file.getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            urls.add(uploadResult.get("url").toString());
        }
        return urls;
    }

    public String uploadImage(MultipartFile file) throws IOException {
        Map uploadResult = cloudinary.uploader().upload(file.getBytes(),
                ObjectUtils.asMap("resource_type", "auto"));
        return uploadResult.get("url").toString();  // return single URL
    }

    public Long saveImageToDatabase(int productId, String imageUrl,boolean isThumbnail) {
        String sql = "INSERT INTO product_images (product_id, image_url, uploaded_at,is_thumbnail) VALUES (?, ?, ?,?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1, productId);
            ps.setString(2, imageUrl);
            ps.setObject(3, LocalDateTime.now());
            if(isThumbnail){
                ps.setObject(4,true);
            }
            else{
                ps.setObject(4,false);

            }
            return ps;
        }, keyHolder);

        // Return the generated image_id
        return keyHolder.getKey().longValue();
    }
}
