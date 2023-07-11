package com.example.demo.service;

import com.example.demo.model.ChucVu;
import com.example.demo.model.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public interface HoaDonService {

    public Page<HoaDon> getAll(Pageable pageable);
    public HoaDon getOne(UUID id);
    public void add(HoaDon hoaDon);
    public void delete(UUID id);
    public void update(HoaDon hoaDon);
    public List<HoaDon> getTen();

    public List<HoaDon> getAll1();
    public HoaDon timMaHoaDon(String mhd);
    public HoaDon save(HoaDon hoaDon);
    public List<HoaDon> search(String ten);

//    public void update1(UUID id);
//    public void update2(UUID id);
}
