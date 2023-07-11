package com.example.demo.service;

import com.example.demo.model.GioHangChiTiet;
import com.example.demo.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.UUID;

public interface GioHangChiTietService {

    public Page<GioHangChiTiet> getAll(Pageable pageable);
    public GioHangChiTiet getOne(UUID id1, UUID id2);
    public void add(GioHangChiTiet gioHangChiTiet);
    public void delete(UUID id1, UUID id2);
    public void update(GioHangChiTiet gioHangChiTiet);
    public String findMa(UUID id);

    public KhachHang findMaKh(String ma);
}
