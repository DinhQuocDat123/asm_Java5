package com.example.demo.controller;

import com.example.demo.model.KhachHang;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.service.KhachHangService;
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
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/khach-hang")
public class KhachHangController {

    @Autowired
    private KhachHangService service;


    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("khachHang") KhachHang khachHang,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<KhachHang> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/khachhang/khach-hang";
    }

    @GetMapping("/detail-khach-hang/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @ModelAttribute("khachHang") KhachHang khachHang,
                         @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        KhachHang kh = service.getOne(id);
        model.addAttribute("khachHang",kh);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<KhachHang> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/khachhang/khach-hang";
    }

    @GetMapping("/remove-khach-hang/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        service.delete(id);
        return "redirect:/khach-hang/hien-thi";
    }

    @PostMapping("/add-khach-hang")
    public String add(Model model, @ModelAttribute("khachHang") KhachHang khachHang) {
        service.add(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/view-update-khach-hang/{id}")
    public String vỉewUpdate(Model model, @PathVariable("id") UUID id){
        KhachHang kh = service.getOne(id);
        model.addAttribute("khachHang", kh);
        return "/khachhang/update-khach-hang";
    }

    @PostMapping("/update-khach-hang/{id}")
    public String update(Model model,@PathVariable("id") UUID id , @ModelAttribute("khachHang") KhachHang khachHang) {
        KhachHang kh = service.getOne(id);
        kh.setMa(khachHang.getMa());
        kh.setHo(khachHang.getHo());
        kh.setTenDem(khachHang.getTenDem());
        kh.setTen(khachHang.getTen());
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setSdt(khachHang.getSdt());
        kh.setDiaChi(khachHang.getDiaChi());
        kh.setThanhPho(khachHang.getThanhPho());
        kh.setQuocGia(khachHang.getQuocGia());
        kh.setMatKhau(khachHang.getMatKhau());
        service.update(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }
}
