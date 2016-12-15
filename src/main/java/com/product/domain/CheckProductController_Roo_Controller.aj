// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.product.domain;

import com.product.domain.CheckProduct;
import com.product.domain.CheckProductController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CheckProductController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CheckProductController.create(@Valid CheckProduct checkProduct, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, checkProduct);
            return "checkproducts/create";
        }
        uiModel.asMap().clear();
        checkProduct.persist();
        return "redirect:/checkproducts/" + encodeUrlPathSegment(checkProduct.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CheckProductController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CheckProduct());
        return "checkproducts/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CheckProductController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("checkproduct", CheckProduct.findCheckProduct(id));
        uiModel.addAttribute("itemId", id);
        return "checkproducts/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CheckProductController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("checkproducts", CheckProduct.findCheckProductEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) CheckProduct.countCheckProducts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("checkproducts", CheckProduct.findAllCheckProducts(sortFieldName, sortOrder));
        }
        return "checkproducts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CheckProductController.update(@Valid CheckProduct checkProduct, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, checkProduct);
            return "checkproducts/update";
        }
        uiModel.asMap().clear();
        checkProduct.merge();
        return "redirect:/checkproducts/" + encodeUrlPathSegment(checkProduct.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CheckProductController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CheckProduct.findCheckProduct(id));
        return "checkproducts/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CheckProductController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CheckProduct checkProduct = CheckProduct.findCheckProduct(id);
        checkProduct.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/checkproducts";
    }
    
    void CheckProductController.populateEditForm(Model uiModel, CheckProduct checkProduct) {
        uiModel.addAttribute("checkProduct", checkProduct);
    }
    
    String CheckProductController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
