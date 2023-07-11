package com.example.demo.repository;

import com.example.demo.model.GioHangChiTiet;
import com.example.demo.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, UUID> {
    @Query("select sp from GioHangChiTiet  sp")
    Page<GioHangChiTiet> findAll(Pageable pageable);
    @Query("select sp from GioHangChiTiet sp where sp.id.gioHang.id=?1 and sp.id.chiTietSanPham.id=?2")
    GioHangChiTiet detail(UUID id1,UUID id2);
    @Transactional
    @Modifying
    @Query("delete from GioHangChiTiet sp where sp.id.gioHang.id=?1 and sp.id.chiTietSanPham.id=?2")
    void deleteGioHang(UUID id1,UUID id2);

    @Query("select gh.ma from GioHang gh left join KhachHang ct on gh.khachHang.id=ct.id where ct.id=?1")
    String findMa(UUID id);

    @Query("select ct from GioHang gh left join KhachHang ct on gh.khachHang.id=ct.id where gh.ma=?1")
    KhachHang findMaKh(String ma);
}
