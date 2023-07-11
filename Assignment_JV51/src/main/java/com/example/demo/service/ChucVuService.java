package com.example.demo.service;

import com.example.demo.model.ChucVu;
import com.example.demo.model.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface ChucVuService {

    public Page<ChucVu> getAll(Pageable pageable);
    public ChucVu getOne(UUID id);
    public void add(ChucVu chucVu);
    public void delete(UUID id);
    public void update(ChucVu chucVu);
    public List<ChucVu> search(String ten);
    public List<ChucVu> getTen();
}
