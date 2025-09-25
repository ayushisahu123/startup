package com.example.youwantt.Controller;

import com.example.youwantt.Bean.Product;
import com.example.youwantt.Bean.User;
import com.example.youwantt.Dao.ProductDao;
import com.example.youwantt.Dao.UserDao;
import com.example.youwantt.Service.ImageUploadService;
import com.example.youwantt.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductDao productDao;
    @Autowired
    ImageUploadService imageUploadService;

    @Autowired
    UserDao userDao;

    @Autowired
    ProductService productService;

    @GetMapping("/addProduct")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("addProduct"); // name without .jsp
        mav.addObject("user", new User());
        return mav;
    }

//    @PostMapping("/addNewProduct")
//    public ModelAndView addNewProduct(
//            @ModelAttribute Product product,
//            @RequestParam("images") List<MultipartFile> images) {
//
//        ModelAndView mav = new ModelAndView("addProduct");
//
//        try {
//            // ✅ Get logged-in vendor
//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            org.springframework.security.core.userdetails.User loggedInUser =
//                    (org.springframework.security.core.userdetails.User) auth.getPrincipal();
//            String username = loggedInUser.getUsername();
//            System.out.println("Logged-in user: " + username);
//
//            // ✅ Set default vendor/category (later, fetch dynamically from DB)
//            product.setVendorId(7L);
//            product.setCategoryId(1L);
//
//            // ✅ Save product and get generated ID
//            int productId = productDao.saveProduct(product);
//            System.out.println("Product saved with ID: " + productId);
//
//            // ✅ Upload images to Cloudinary & persist URLs in DB
//            if (images != null && !images.isEmpty()) {
//                List<String> imageUrls = imageUploadService.uploadImages(images);
//                for (String url : imageUrls) {
//                    imageUploadService.saveImageToDatabase(productId, url);
//                }
//                System.out.println("Images uploaded & saved for product ID: " + productId);
//            } else {
//                System.out.println("No images received for product ID: " + productId);
//            }
//
//            // ✅ Load vendor products for dashboard
//            List<Product> products = productDao.getProductsByVendorId(7L);
//            mav.addObject("products", products);
//            mav.addObject("successMessage", "Product added successfully!");
//
//        } catch (Exception e) {
//            System.err.println("Error while saving product: " + e.getMessage());
//            e.printStackTrace();
//            mav.addObject("errorMessage", "Failed to add product. Please try again.");
//        }
//
//        return mav;
//    }


//]#api - send in response list of products by vendorid
//
//    uodte products api
//
//    delete product api
//
//
//    get productbyproductid


    @PostMapping("/addNewProduct")
    public ModelAndView addNewProduct(
            @ModelAttribute Product product,
            @RequestParam("images") List<MultipartFile> images) {

        ModelAndView mav = new ModelAndView("addProduct");

        try {
            // Get logged-in vendor username
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            org.springframework.security.core.userdetails.User loggedInUser =
                    (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            String username = loggedInUser.getUsername();
            System.out.println("username: " + username);
            Long vendorId = userDao.getUserIdByUsername(username);
            // Delegate to service layer
            productService.addNewProduct(product, images, username);
            // Load vendor products for dashboard
            List<Product> products = productDao.getProductsByVendorId(vendorId);
            mav.addObject("products", products);
            mav.addObject("successMessage", "Product added successfully!");
        } catch (Exception e) {
            System.err.println("Error while saving product: " + e.getMessage());
            e.printStackTrace();
            mav.addObject("errorMessage", "Failed to add product. Please try again.");
        }

        return mav;
    }


    @GetMapping("/getAllProducts")
    public ModelAndView getAllProducts(@RequestParam("vendorId") Integer vendorId) {
        ModelAndView mav = new ModelAndView("addProduct");
        try {
            // Load vendor products for dashboard
            List<Product> products = productDao.getProductsByVendorId(vendorId);
            mav.addObject("products", products);
            } catch (Exception e) {
            System.err.println("Error while fetching products: " + e.getMessage());
            e.printStackTrace();
            mav.addObject("errorMessage", "Failed to load products. Please try again.");
        }
        return mav;
        }




    @PostMapping("/updateProduct")
    public ModelAndView updateProduct(
            @ModelAttribute Product product,
            @RequestParam(value = "images", required = false) List<MultipartFile> images) {

        ModelAndView mav = new ModelAndView("addProduct"); // JSP page

        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            org.springframework.security.core.userdetails.User loggedInUser =
                    (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            String username = loggedInUser.getUsername();
            Long vendorId = userDao.getUserIdByUsername(username);

            // 2️⃣ Ensure vendor can only update their own product
            product.setVendorId(vendorId);

            // 3️⃣ Update product (details + optional images)
            productDao.updateProductDetails(product);

            // 4️⃣ Fetch updated product
            Product updatedProduct = productDao.getProductById(product.getProductId());

            // 5️⃣ Load all vendor products for dashboard
            List<Product> products = productDao.getProductsByVendorId(vendorId);

            // 6️⃣ Add data to ModelAndView
            mav.addObject("products", products);
            mav.addObject("updatedProduct", updatedProduct);
            mav.addObject("successMessage", "Product updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "Failed to update product. Please try again.");
        }

        return mav;
    }

    @PostMapping("/deleteProduct")
    public ModelAndView deleteProduct(@RequestParam("productId") Long productId) {
        ModelAndView mav = new ModelAndView("addProduct");

        try {
            // Get logged-in vendorId
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            org.springframework.security.core.userdetails.User loggedInUser =
                    (org.springframework.security.core.userdetails.User) auth.getPrincipal();
            String username = loggedInUser.getUsername();
            Long vendorId = userDao.getUserIdByUsername(username);

            // Delete product
            boolean deleted = productService.deleteProduct(productId, vendorId);

            if (deleted) {
                mav.addObject("successMessage", "Product deleted successfully!");
            } else {
                mav.addObject("errorMessage", "Product not found or you don't have permission to delete it.");
            }

            // Reload vendor products
            List<Product> products = productDao.getProductsByVendorId(vendorId);
            mav.addObject("products", products);

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMessage", "Failed to delete product. Please try again.");
        }

        return mav;
    }


}
