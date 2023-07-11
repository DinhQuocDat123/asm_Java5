package com.example.demo.service.impl;

import com.example.demo.model.ChucVu;
import com.example.demo.model.HoaDon;
import com.example.demo.repository.ChucVuRepository;
import com.example.demo.repository.HoaDonRepository;
import com.example.demo.service.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    HoaDonRepository repository;
    @Override
    public Page<HoaDon> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public HoaDon getOne(UUID id) {
        return repository.detail(id);
    }

    @Override
    public void add(HoaDon hoadon) {
        repository.save(hoadon);
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public void update(HoaDon hoadon) {
        repository.save(hoadon);
    }

    @Override
    public List<HoaDon> getTen() {
        return repository.findAll();
    }

    @Override
    public List<HoaDon> getAll1() {
        return repository.findAll();
    }

    @Override
    public HoaDon timMaHoaDon(String mhd) {
        return repository.timmhd(mhd);
    }

    @Override
    public HoaDon save(HoaDon hoaDon) {
        return repository.save(hoaDon);
    }


    @Override
    public List<HoaDon> search(String ten) {
        return null;
    }

//    @Override
//    public void update1(UUID id) {
//        repository.update1(id);
//    }
//
//    @Override
//    public void update2(UUID id) {
//        repository.update2(id);
//    }


}
