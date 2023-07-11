package com.example.demo.controller;

import com.example.demo.model.HoaDon;
import com.example.demo.model.KhachHang;
import com.example.demo.repository.HoaDonRepository;
import com.example.demo.service.HoaDonService;
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

import java.sql.Date;
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonService service;

    @Autowired
    private KhachHangService khService;

    @Autowired
    private NhanVienService nvService;


    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<HoaDon> page = service.getAll(pageable);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/hoadon/hoa-don";
    }

    @GetMapping("/detail-hoa-don/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @ModelAttribute("hoaDon") HoaDon hoaDon,
                         @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
        HoaDon hd = service.getOne(id);
        model.addAttribute("hoaDon", hd);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<HoaDon> page = service.getAll(pageable);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/hoadon/hoa-don";
    }

    @GetMapping("/remove-hoa-don/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        service.delete(id);
        return "redirect:/hoa-don/hien-thi";
    }

    @PostMapping("/add-hoa-don")
    public String add(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        service.add(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/view-update-hoa-don/{id}")
    public String vỉewUpdate(Model model, @PathVariable("id") UUID id) {
        HoaDon hd = service.getOne(id);
        model.addAttribute("hoaDon", hd);
        model.addAttribute("khachHang", khService.getTen());
        model.addAttribute("nhanVien", nvService.getTen());
        return "/hoadon/update-hoa-don";
    }

    @PostMapping("/update-hoa-don/{id}")
    public String update(Model model, @PathVariable("id") UUID id, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        HoaDon hd = service.getOne(id);
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setNhanVien(hoaDon.getNhanVien());
        hd.setMa(hoaDon.getMa());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setNgayShip(hoaDon.getNgayShip());
        hd.setNgayNhan(hoaDon.getNgayNhan());
        hd.setTinhTrang(hoaDon.getTinhTrang());
        hd.setTenNguoiNhan(hoaDon.getTenNguoiNhan());
        hd.setDiaChi(hoaDon.getDiaChi());
        hd.setSdt(hoaDon.getSdt());
        service.update(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/trang-thai-0/{id}")
    public String trangThai1(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        HoaDon hoaDon1 = service.getOne(id);
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        hoaDon1.setTinhTrang(0);
        hoaDon1.setNgayThanhToan(date);
        service.update(hoaDon1);
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }

    @GetMapping("/trang-thai-1/{id}")
    public String trangThai2(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        HoaDon hoaDon1 = service.getOne(id);
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        hoaDon1.setTinhTrang(1);
        hoaDon1.setNgayThanhToan(date);
        service.update(hoaDon1);
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize);
        Page<HoaDon> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/hoa-don/hien-thi";
    }
}
