package com.example.youwantt.Service;

import com.example.youwantt.Bean.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {
    void addNewProduct(Product product, List<MultipartFile> images, String username,MultipartFile thumbnailImage);

    boolean deleteProduct(Long productId, Long vendorId);
}
