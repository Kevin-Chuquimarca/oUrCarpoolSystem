package ec.edu.espe.driverapproval.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "driver_admin", schema = "driver_approval_db")
@NoArgsConstructor
@AllArgsConstructor
public class DriverAdminEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_ad", nullable = false)
    private int idAd;
    @Basic
    @Column(name = "name_ad", nullable = false, length = 20)
    private String nameAd;
    @Basic
    @Column(name = "last_name_ad", nullable = false, length = 20)
    private String lastNameAd;
    @Basic
    @Column(name = "email_ad", nullable = false, length = 30)
    private String emailAd;
    @Basic
    @Column(name = "phone_ad", nullable = false, length = 10)
    private String phoneAd;
}
