package model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author admin
 */
public class Order implements Serializable{
    private int oid;
    private String odate, sdate;
    private String username;
    private float payment, shipping, total;
    private int status;
    DecimalFormat df = new DecimalFormat("#.00");
    
    public Order() {
        this.status = 0;
    }
    
    public Order(int oid, String username, float payment, float shipping, float total) {
        
        this.oid = oid;
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        //Given Date in String format
        this.odate = sdf.format(date);
        //Specifying date format that matches the given date

        Calendar c = Calendar.getInstance();
        try {
            //Setting the date to the given date
            c.setTime(sdf.parse(odate));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //Number of Days to add
        c.add(Calendar.DAY_OF_MONTH, 5);
        //Date after adding the days to the given date
        this.sdate = sdf.format(c.getTime());

        this.username = username;
        this.payment = Float.parseFloat(df.format(payment));
        this.shipping = Float.parseFloat(df.format(shipping));
        this.total = Float.parseFloat(df.format(total));
        this.status = 0;
    }
    
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = Float.parseFloat(df.format(payment));
    }

    public float getShipping() {
        return shipping;
    }

    public void setShipping(float shipping) {
        this.shipping = Float.parseFloat(df.format(shipping));
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = Float.parseFloat(df.format(total));
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "oid=" + oid + ", odate=" + odate + ", sdate=" + sdate + ", username=" + username + ", status=" + status + ", payment=" + payment + ", shipping=" + shipping + ", total=" + total + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Order other = (Order) obj;
        if (this.oid != other.oid) {
            return false;
        }
        if (Float.floatToIntBits(this.payment) != Float.floatToIntBits(other.payment)) {
            return false;
        }
        if (Float.floatToIntBits(this.shipping) != Float.floatToIntBits(other.shipping)) {
            return false;
        }
        if (Float.floatToIntBits(this.total) != Float.floatToIntBits(other.total)) {
            return false;
        }
        if (this.status != other.status) {
            return false;
        }
        if (!Objects.equals(this.odate, other.odate)) {
            return false;
        }
        if (!Objects.equals(this.sdate, other.sdate)) {
            return false;
        }
        if (!Objects.equals(this.username, other.username)) {
            return false;
        }
        if (!Objects.equals(this.df, other.df)) {
            return false;
        }
        return true;
    }
    
    
}


