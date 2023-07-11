package com.example.demo.controller;


import com.example.demo.model.NhaSanXuat;
import com.example.demo.service.NXSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/nha-san-xuat")
public class NXSController {

    @Autowired
    private NXSService service;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("nsx") NhaSanXuat nha,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/nhasanxuat/nha-san-xuat";
    }

    @PostMapping("add-nha-san-xuat")
    public String addNhaSanXuat(Model model, @ModelAttribute("nsx") NhaSanXuat nha, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        service.add(nha);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/nha-san-xuat/hien-thi";
    }

    @PostMapping("/update-nha-san-xuat/{id}")
    public String updateNhaSanXuat(Model model, @PathVariable("id") UUID id, @ModelAttribute("nsx") NhaSanXuat nha, @RequestParam("pageNum") Optional<Integer> pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        NhaSanXuat sp = service.getOne(id);
        sp.setMa(nha.getMa());
        sp.setTen(nha.getTen());
        service.update(sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/nha-san-xuat/hien-thi";
    }

    @GetMapping("/remove-nha-san-xuat/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("nha") NhaSanXuat nha) {
        service.delete(id);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/nha-san-xuat/hien-thi";
    }

    @GetMapping("/detail-nha-san-xuat/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        NhaSanXuat sp = service.getOne(id);
        model.addAttribute("nsx", sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/nhasanxuat/nha-san-xuat";
    }

    @GetMapping("/view-update-nha-san-xuat/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        NhaSanXuat sp = service.getOne(id);
        model.addAttribute("nsx", sp);
        return "/nhasanxuat/update-nha-san-xuat";
    }

    @PostMapping("/search-nha-san-xuat")
    public String search(Model model, @RequestParam("tenTk") String ten, @ModelAttribute("nha") NhaSanXuat nha, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        List<NhaSanXuat> listTk = new ArrayList<>();
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhaSanXuat> page = service.getAll(pageable);
        for (NhaSanXuat sp : page
        ) {
            if (sp.getTen().contains(ten)) {
                listTk = service.search(ten);
            }
        }
        model.addAttribute("list", listTk);
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "nhasanxuat";
    }
}
