package com.example.demo.controller;

import com.example.demo.model.ChucVu;
import com.example.demo.model.CuaHang;
import com.example.demo.model.NhanVien;
import com.example.demo.repository.NhanVienRepository;
import com.example.demo.service.ChucVuService;
import com.example.demo.service.CuaHangService;
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
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienService nvService;

    @Autowired
    private ChucVuService cvService;

    @Autowired
    private CuaHangService chService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("nhanVien") NhanVien nhanVien, @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "4") Integer pageSize) {
        Sort sort = Sort.by("ma");
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> nhanViens = nvService.getAll(pageable);
        model.addAttribute("cuaHang", chService.getTen());
        model.addAttribute("chucVu", cvService.getTen());

        model.addAttribute("list", nhanViens.getContent());
        model.addAttribute("page", nhanViens.getNumber());
        model.addAttribute("total", nhanViens.getTotalPages());
        return "/nhanvien/nhan-vien";
    }

    //
//    @ModelAttribute("chucVu")
//    public List<ChucVu> hienThiChucVu(){
//        return cvService.getTen();
//    }
//
//    @ModelAttribute("cuaHang")
//    public List<CuaHang> hienThiCuaHang(){
//        return chService.getTen();
//    }
    @GetMapping("/detail-nhan-vien/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @ModelAttribute("NhanVien") NhanVien nhanVien, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "4") Integer pageSize) {
        NhanVien nv = nvService.getOne(id);
        model.addAttribute("nhanVien", nv);
        model.addAttribute("cuaHang", chService.getTen());
        model.addAttribute("chucVu", cvService.getTen());
        Sort sort = Sort.by("ma");
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<NhanVien> nhanViens = nvService.getAll(pageable);
        model.addAttribute("list", nhanViens.getContent());
        model.addAttribute("page", nhanViens.getNumber());
        model.addAttribute("total", nhanViens.getTotalPages());
        return "/nhanvien/nhan-vien";
    }

    @GetMapping("/remove-nhan-vien/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        nvService.delete(id);
        return "redirect:/nhan-vien/hien-thi";
    }

    @PostMapping("/add-nhan-vien")
    public String add(Model model, @ModelAttribute("NhanVien") NhanVien nhanVien) {
        nvService.add(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/view-update-nhan-vien/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        NhanVien nv = nvService.getOne(id);
        model.addAttribute("nhanVien", nv);
        model.addAttribute("cuaHang", chService.getTen());
        model.addAttribute("chucVu", cvService.getTen());
        return "/nhanvien/update-nhan-vien";
    }

    @PostMapping("/update-nhan-vien/{id}")
    public String update(Model model, @PathVariable("id") UUID id, @ModelAttribute("NhanVien") NhanVien nhanVien) {
        NhanVien nv = nvService.getOne(id);
        nv.setMa(nhanVien.getMa());
        nv.setHo(nhanVien.getMa());
        nv.setTenDem(nhanVien.getMa());
        nv.setTen(nhanVien.getMa());
        nv.setGioiTinh(nhanVien.getMa());
        nv.setNgaySinh(nhanVien.getNgaySinh());
        nv.setDiaChi(nhanVien.getMa());
        nv.setSdt(nhanVien.getMa());
        nv.setMatKhau(nhanVien.getMa());
        nv.setCuaHang(nhanVien.getCuaHang());
        nv.setChucVu(nhanVien.getChucVu());
        nv.setTrangThai(nhanVien.getTrangThai());
        nvService.update(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }
}
