package ec.edu.espe.DriverApproval.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Date;

@Entity
@Data
@Table(name = "driver_request", schema = "driver_approval_db")
@NamedQueries({
        @NamedQuery(name = "DriverRequestEntity.findByStateDr", query = "SELECT d FROM DriverRequestEntity d WHERE d.stateDr = :stateDr"),
})
public class DriverRequestEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_dr", nullable = false)
    private int idDr;
    @Basic
    @Column(name = "id_ad", nullable = false)
    private int idAd;
    @Basic
    @Column(name = "email_dr", nullable = false, length = 30)
    private String emailDr;
    @Basic
    @Column(name = "shipping_date_dr", nullable = false)
    private Date shippingDateDr;
    @Basic
    @Column(name = "approval_date_dr")
    private Date approvalDateDr;
    @Basic
    @Column(name = "type_lic_dr", nullable = false, length = 1)
    private String typeLicDr;
    @Basic
    @Column(name = "expiry_date_lic_dr", nullable = false)
    private Date expiryDateLicDr;
    @Basic
    @Column(name = "photo_lic_dr", nullable = false)
    private String photoLicDr;
    @Basic
    @Column(name = "plate_car_dr", nullable = false, length = 7)
    private String plateCarDr;
    @Basic
    @Column(name = "photo_car_dr", nullable = false, length = 30)
    private String photoCarDr;
    @Basic
    @Column(name = "state_dr", nullable = false, length = 1)
    private String stateDr;
    @Basic
    @Column(name = "message_dr", length = 150)
    private String messageDr;
    @Basic
    @Column(name = "cod_user_dr", nullable = false)
    private int codUserDr;
}
