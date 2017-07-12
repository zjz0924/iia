package cn.wow.support.web;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.wow.common.domain.Contact;
import cn.wow.common.service.ContactService;
import cn.wow.support.utils.Contants;

@Controller
@RequestMapping(value = "contact")
public class ContactController{

    private static Logger logger = LoggerFactory.getLogger(ContactController.class);

    @Autowired
    private ContactService contactService;
    
    private final long CONTACT_ID = 1;

    @RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, Model model){
        Contact contact = contactService.selectOne(CONTACT_ID);
        model.addAttribute("facadeBean", contact);

        return "contact_detail";
    }

    @RequestMapping(value = "/save")
    public String save(HttpServletRequest request, Model model, String name, String address, String url, String phone, String fax){
        String resultCode = "";
        String resultMsg = "";
        Contact contact = null;

        try{
            contact = contactService.selectOne(CONTACT_ID);
            contact.setName(name);
            contact.setAddress(address);
            contact.setUrl(url);
            contact.setPhone(phone);
            contact.setFax(fax);
            contactService.update(contact);

            resultCode = Contants.EDIT_SUCCESS;
            resultMsg = Contants.EDIT_SUCCESS_MSG;
        }catch(Exception ex){
            ex.printStackTrace();
            resultCode = Contants.EXCEPTION;
            resultMsg = Contants.EXCEPTION_MSG;
        }

        model.addAttribute("resultCode",  resultCode);
        model.addAttribute("resultMsg", resultMsg);
        model.addAttribute("facadeBean", contact);
        return "contact_detail";
    }

}