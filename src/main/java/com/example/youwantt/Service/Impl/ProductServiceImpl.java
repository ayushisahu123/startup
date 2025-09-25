package com.example.youwantt.Service.Impl;

import com.example.youwantt.Bean.Product;
import com.example.youwantt.Dao.ProductDao;
import com.example.youwantt.Service.ImageUploadService;
import com.example.youwantt.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ImageUploadService imageUploadService;

    @Override
    public void addNewProduct(Product product, List<MultipartFile> images, String username) {
        // Later: fetch vendorId dynamically using username from DB
        product.setVendorId(7L);
        product.setCategoryId(1L);

        // Save product
        int productId = productDao.saveProduct(product);
        System.out.println("Product saved with ID: " + productId);

        // Upload images & persist
        if (images != null && !images.isEmpty()) {
            List<String> imageUrls = null;
            try {
                imageUrls = imageUploadService.uploadImages(images);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            for (String url : imageUrls) {
                imageUploadService.saveImageToDatabase(productId, url);
            }
            System.out.println("Images uploaded & saved for product ID: " + productId);
        } else {
            System.out.println("No images received for product ID: " + productId);
        }
    }

    public boolean deleteProduct(Long productId, Long vendorId) {
        // 1️⃣ Delete images first to avoid FK constraint error
        productDao.deleteProductImagesByProductId(productId);
        // 2️⃣ Delete the product
        int rows = productDao.deleteProductById(productId, vendorId);
        return rows > 0;
    }

}
