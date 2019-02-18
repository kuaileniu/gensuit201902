package ${gen.basePackage?replace("/",".")};

import ${gen.basePackage?replace("/",".")}.GenApplication;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.helperPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import javax.sql.*;

public abstract class BaseTest {
    public Date current = new Date();
    @Autowired
    DataSource dataSource;

    public void createAll(){}
}