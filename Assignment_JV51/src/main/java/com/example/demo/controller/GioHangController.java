package com.example.demo.controller;

import com.example.demo.model.GioHang;
import com.example.demo.model.GioHang;
import com.example.demo.model.KhachHang;
import com.example.demo.repository.GioHangRepository;

import com.example.demo.service.GioHangService;
import com.example.demo.service.KhachHangService;
import com.example.demo.service.NhanVienService;
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
@RequestMapping("/gio-hang")
public class GioHangController {

    @Autowired
    private GioHangService service;

    @Autowired
    private KhachHangService khService;

    @Autowired
    private NhanVienService nvService;


    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("gioHang") GioHang gioHang,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<GioHang> page = service.getAll(pageable);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/giohang/gio-hang";
    }

    @GetMapping("/detail-gio-hang/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @ModelAttribute("gioHang") GioHang gioHang,
                         @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        GioHang hd = service.getOne(id);
        model.addAttribute("gioHang",hd);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<GioHang> page = service.getAll(pageable);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/giohang/gio-hang";
    }

    @GetMapping("/remove-gio-hang/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        service.delete(id);
        return "redirect:/gio-hang/hien-thi";
    }

    @PostMapping("/add-gio-hang")
    public String add(Model model, @ModelAttribute("gioHang") GioHang gioHang) {
        service.add(gioHang);
        return "redirect:/gio-hang/hien-thi";
    }

    @GetMapping("/view-update-gio-hang/{id}")
    public String vỉewUpdate(Model model, @PathVariable("id") UUID id){
        GioHang hd = service.getOne(id);
        model.addAttribute("gioHang", hd);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        return "/giohang/update-gio-hang";
    }

    @PostMapping("/update-gio-hang/{id}")
    public String update(Model model,@PathVariable("id") UUID id , @ModelAttribute("gioHang") GioHang gioHang) {
        GioHang hd = service.getOne(id);
        hd.setKhachHang(gioHang.getKhachHang());
        hd.setNhanVien(gioHang.getNhanVien());
        hd.setMa(gioHang.getMa());
        hd.setNgayTao(gioHang.getNgayTao());
        hd.setNgayThanhToan(gioHang.getNgayThanhToan());
//        hd.setNgayShip(gioHang.getNgayShip());
//        hd.setNgayNhan(gioHang.getNgayNhan());
        hd.setTinhTrang(gioHang.getTinhTrang());
        hd.setTenNguoiNhan(gioHang.getTenNguoiNhan());
        hd.setDiaChi(gioHang.getDiaChi());
        hd.setSdt(gioHang.getSdt());
        service.update(gioHang);
        return "redirect:/gio-hang/hien-thi";
    }
}
