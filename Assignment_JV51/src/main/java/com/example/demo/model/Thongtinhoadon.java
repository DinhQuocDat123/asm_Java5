package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder

public class Thongtinhoadon {

    private UUID id;
    private String ma;
    private Integer tongsanpham;
    private Integer tongtien;
    private Date ngayTao;
    private String tinhTrang;


}
