package com.example.demo.service;

import com.example.demo.model.GioHang;
import com.example.demo.model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface GioHangService {

    public Page<GioHang> getAll(Pageable pageable);
    public GioHang getOne(UUID id);
    public void add(GioHang hoaDon);
    public void delete(UUID id);
    public void update(GioHang hoaDon);
    public List<GioHang> getTen();

    public ArrayList<GioHang> getMa();
}
