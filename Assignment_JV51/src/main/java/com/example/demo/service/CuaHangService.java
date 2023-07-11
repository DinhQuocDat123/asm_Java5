package com.example.demo.service;

import com.example.demo.model.CuaHang;
import com.example.demo.model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface CuaHangService {

    public Page<CuaHang> getAll(Pageable pageable);
    public CuaHang getOne(UUID id);
    public void add(CuaHang cuaHang);
    public void delete(CuaHang cuaHang);
    public void update(CuaHang cuaHang);
    public List<CuaHang> search(String ten);
    public List<CuaHang> getTen();
}
