package com.example.demo.service.impl;

import com.example.demo.model.HoaDonChiTiet;
import com.example.demo.repository.HoaDonChiTietRepository;
import com.example.demo.service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {
    @Autowired
    HoaDonChiTietRepository repository;


    @Override
    public Page<HoaDonChiTiet> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public HoaDonChiTiet getOne(UUID id1, UUID id2) {
        return repository.detail(id1, id2);
    }

    @Override
    public void add(HoaDonChiTiet hoaDonChiTiet) {
        repository.save(hoaDonChiTiet);
    }

    @Override
    public void delete(UUID id1, UUID id2) {
        repository.deleteHoaDon(id1, id2);
    }

    @Override
    public void update(HoaDonChiTiet hoaDonChiTiet) {
        repository.save(hoaDonChiTiet);
    }

    @Override
    public HoaDonChiTiet getOne1(Integer sl) {
        return null;
    }

    @Override
    public void ADDvsUPDATE(HoaDonChiTiet hoaDonChiTiet) {
repository.save(hoaDonChiTiet);
    }

    @Override
    public void themsql(UUID id1, UUID id2, Integer sl, BigDecimal dg) {

    }

//    @Override
//    public List<HoaDonChiTiet> search(String ten) {
//        return null;
//    }

    @Override
    public List<HoaDonChiTiet> detailall(UUID id) {
        return repository.detailall(id);
    }

    @Override
    public Integer tongSanPham(UUID id) {
        Integer Tongsp=0;
        for (HoaDonChiTiet hdct : repository.detailall(id)) {
            Tongsp = hdct.getSoLuong() + Tongsp;
        }
        return Tongsp;
    }

    @Override
    public Integer tongTien(UUID id) {
//        Integer Tongtien=0;
//
//        for (HoaDonChiTiet hdct : repository.detailall(id)) {
//            Tongtien = Tongtien + hdct.getSoLuong() * hdct.getDonGia();
//        }
        return null;
    }

    @Override
    public List<HoaDonChiTiet> list(List<HoaDonChiTiet> hd) {
        return repository.saveAll(hd);
    }
}
