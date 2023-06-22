package ec.edu.espe.StudentRegistration.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name = "DRIVER", schema = "our_carpool_db", catalog = "")
public class DriverEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID_DRIVER")
    private int idDriver;
    @Basic
    @Column(name = "ID_USER")
    private int idUser;
    @Basic
    @Column(name = "PIN_ADMIN")
    private int pinAdmin;
    @Basic
    @Column(name = "APPROVAL_DATE_DRIVER")
    private Date approvalDateDriver;
    @Basic
    @Column(name = "SCORE_DRIVER")
    private BigDecimal scoreDriver;
    @Basic
    @Column(name = "TYPE_LIC_DRIVER")
    private String typeLicDriver;
    @Basic
    @Column(name = "EXPIRY_DATE_LIC_DRIVER")
    private Date expiryDateLicDriver;
    @Basic
    @Column(name = "PHOTO_LIC_DRIVER")
    private byte[] photoLicDriver;

    public int getIdDriver() {
        return idDriver;
    }

    public void setIdDriver(int idDriver) {
        this.idDriver = idDriver;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getPinAdmin() {
        return pinAdmin;
    }

    public void setPinAdmin(int pinAdmin) {
        this.pinAdmin = pinAdmin;
    }

    public Date getApprovalDateDriver() {
        return approvalDateDriver;
    }

    public void setApprovalDateDriver(Date approvalDateDriver) {
        this.approvalDateDriver = approvalDateDriver;
    }

    public BigDecimal getScoreDriver() {
        return scoreDriver;
    }

    public void setScoreDriver(BigDecimal scoreDriver) {
        this.scoreDriver = scoreDriver;
    }

    public String getTypeLicDriver() {
        return typeLicDriver;
    }

    public void setTypeLicDriver(String typeLicDriver) {
        this.typeLicDriver = typeLicDriver;
    }

    public Date getExpiryDateLicDriver() {
        return expiryDateLicDriver;
    }

    public void setExpiryDateLicDriver(Date expiryDateLicDriver) {
        this.expiryDateLicDriver = expiryDateLicDriver;
    }

    public byte[] getPhotoLicDriver() {
        return photoLicDriver;
    }

    public void setPhotoLicDriver(byte[] photoLicDriver) {
        this.photoLicDriver = photoLicDriver;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DriverEntity that = (DriverEntity) o;
        return idDriver == that.idDriver && idUser == that.idUser && pinAdmin == that.pinAdmin && Objects.equals(approvalDateDriver, that.approvalDateDriver) && Objects.equals(scoreDriver, that.scoreDriver) && Objects.equals(typeLicDriver, that.typeLicDriver) && Objects.equals(expiryDateLicDriver, that.expiryDateLicDriver) && Arrays.equals(photoLicDriver, that.photoLicDriver);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idDriver, idUser, pinAdmin, approvalDateDriver, scoreDriver, typeLicDriver, expiryDateLicDriver);
        result = 31 * result + Arrays.hashCode(photoLicDriver);
        return result;
    }
}
