package com.product.domain;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/checkproducts")
@Controller
@RooWebScaffold(path = "checkproducts", formBackingObject = CheckProduct.class)
public class CheckProductController {
}
