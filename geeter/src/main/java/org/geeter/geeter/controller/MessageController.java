package org.geeter.geeter.controller;

import org.geeter.geeter.domain.Message;
import org.geeter.geeter.domain.User;
import org.geeter.geeter.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Set;

@Controller
@RequestMapping("/user-messages")
public class MessageController{

    @Autowired
    MessageRepo messageRepo;

    @Autowired
    MainController mainController;

    @GetMapping("{user}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            Model model,
            @RequestParam(required = false) Message message
    ) {
        Set<Message> messages = user.getMessage();

        model.addAttribute("messages", messages);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        model.addAttribute("message", message);

        return "userMessages";
    }
    @PostMapping("{user}")
    public String updateMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ){
        if(message.getAuthor().equals(currentUser))
        {
            if(!StringUtils.isEmpty(text))
            {
                message.setText(text);
            }
            if(!StringUtils.isEmpty(tag))
            {
                message.setTag(tag);
            }
            mainController.saveFile(file, message);
            messageRepo.save(message);
        }
        return "redirect:/user-messages/" + user;
    }

}
