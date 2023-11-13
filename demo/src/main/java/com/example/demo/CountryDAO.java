package com.example.demo;
import oracle.jdbc.OracleConnection;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import static java.sql.Types.REF_CURSOR;
public class CountryDAO {
    public List<Country> getCountries(){
        List<Country> countries = new ArrayList<>();
        try {
            OracleConnection connection = ConnectionDB.getConn();
            CallableStatement statement = connection.prepareCall("{call GetAllCountries(?)}");
            statement.registerOutParameter(1,REF_CURSOR);
            statement.execute();
            ResultSet set = (java.sql.ResultSet)statement.getObject(1);
            while (set.next()) {
                Country item = new Country(
                        set.getString("country_id"),
                        set.getString("country_name"),
                        set.getString("country_flag")
                );
                countries.add(item);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return countries;
    }
    public boolean UpdateCountry(Country country){
        boolean rowUpdated = false;
        try{
            OracleConnection connection = ConnectionDB.getConn();
            PreparedStatement statement = connection.prepareCall("update COUNTRIES set country_name=?, country_flag=? where country_id=?");
            statement.setString(1,country.getCountry_name());
            statement.setString(2,country.getCountry_flag());
            statement.setString(3,country.getCountry_id());
            rowUpdated=statement.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowUpdated;
    }
    public boolean DeleteCountry(String id){
        boolean rowDeleted = false;
        try{
            OracleConnection connection = ConnectionDB.getConn();
            PreparedStatement statement = connection.prepareCall("delete from COUNTRIES where country_id=?");
            statement.setString(1,id);
            rowDeleted=statement.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowDeleted;
    }
    public Country getCountryById(String id){
        Country country=null;
        try{
            OracleConnection connection = ConnectionDB.getConn();
            PreparedStatement statement = connection.prepareCall("select * from COUNTRIES where country_id=?");
            statement.setString(1,id);
            ResultSet rs=statement.executeQuery();
            while(rs.next()){
                country= new Country(
                        rs.getString("country_id"),
                        rs.getString("country_name"),
                        rs.getString("country_flag")
                );
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return country;
    }
    public void InsertCountry(Country country){
        try{
            OracleConnection connection = ConnectionDB.getConn();
            PreparedStatement stat=connection.prepareStatement("insert into COUNTRIES values(?,?,?)");
            stat.setString(1,country.country_id);
            stat.setString(2,country.country_name);
            stat.setString(3,country.country_flag);
            stat.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
