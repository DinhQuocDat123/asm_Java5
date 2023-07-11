package com.example.demo.service;

import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietService {

    public Page<HoaDonChiTiet> getAll(Pageable pageable);
    public HoaDonChiTiet getOne(UUID id1, UUID id2);
    public void add(HoaDonChiTiet hoaDonChiTiet);
    public void delete(UUID id1, UUID id2);
    public void update(HoaDonChiTiet hoaDonChiTiet);

    public HoaDonChiTiet getOne1(Integer sl);

    public void ADDvsUPDATE(HoaDonChiTiet hoaDonChiTiet);
    public void themsql(UUID id1, UUID id2, Integer sl, BigDecimal dg);

    public List<HoaDonChiTiet> detailall(UUID id);

    public Integer tongSanPham(UUID id);
    public Integer tongTien(UUID id);
    public List<HoaDonChiTiet> list(List<HoaDonChiTiet> hd);
    }


