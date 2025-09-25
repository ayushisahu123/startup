package com.example.youwantt.Dao;

import com.example.youwantt.Bean.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class ProductDao {


    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ProductDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public int saveProduct(Product product) {
        String sql = "INSERT INTO products (product_name, price, category_id, description, vendor_id) VALUES (?, ?, ?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, product.getProductName());
            ps.setBigDecimal(2, product.getPrice());
            ps.setLong(3, product.getCategoryId());
            ps.setString(4, product.getDescription());
            ps.setLong(5, product.getVendorId());
            return ps;
        }, keyHolder);

        // Return the generated product_id
        return keyHolder.getKey().intValue();
    }

    public List<Product> getProductsByVendorId(long vendorId) {
        String sql = "SELECT * FROM products WHERE vendor_id = ?";
        return jdbcTemplate.query(sql, new Object[]{vendorId}, new BeanPropertyRowMapper<>(Product.class));
    }
    public int updateProductDetails(Product product) {
        String sql = "UPDATE products SET name = ?, description = ?, price = ? WHERE product_id = ? AND vendor_id = ?";
        return jdbcTemplate.update(sql, product.getProductName(), product.getDescription(), product.getPrice(),
                product.getProductId(), product.getVendorId());
    }


    public Product getProductById(Long productId) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        Product product = jdbcTemplate.queryForObject(sql, new Object[]{productId}, (rs, rowNum) -> {
            Product p = new Product();
            p.setProductId(rs.getLong("product_id"));
            p.setVendorId(rs.getLong("vendor_id"));
            p.setProductName(rs.getString("name"));
            p.setDescription(rs.getString("description"));
            p.setPrice(rs.getBigDecimal("price"));
            p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            return p;
        });
        return product;
    }
    // Delete all images for a product
    public int deleteProductImagesByProductId(Long productId) {
        String sql = "DELETE FROM product_images WHERE product_id = ?";
        return jdbcTemplate.update(sql, productId);
    }

    // Delete the product itself
    public int deleteProductById(Long productId, Long vendorId) {
        String sql = "DELETE FROM products WHERE product_id = ? AND vendor_id = ?";
        return jdbcTemplate.update(sql, productId, vendorId);
    }
}
