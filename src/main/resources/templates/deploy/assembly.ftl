<?xml version="1.0" encoding="utf-8"?>
<assembly
        xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.2 http://maven.apache.org/xsd/assembly-1.1.2.xsd">

    <id>${r"$"}{project.version}</id>
    <formats>
        <format>zip</format>
    </formats>
    <baseDirectory>${r"$"}{project.name}</baseDirectory>
    <includeBaseDirectory>false</includeBaseDirectory>

    <fileSets>
        <fileSet>
            <directory>/deploy/${r"$"}{env}/script</directory>
            <outputDirectory>/</outputDirectory>
            <includes>
                <include>*.cmd</include>
                <include>*.sh</include>
            </includes>
        </fileSet>
<#if (gen.initProject == true)>
        <fileSet>
            <directory> ${r"$"}{project.build.directory}</directory>
            <outputDirectory>/</outputDirectory>
            <includes>
                <include>${gen.server}.jar</include>
            </includes>
            <fileMode>0755</fileMode>
        </fileSet>
</#if>
<#if (gen.initProject == false)>
        <fileSet>
            <directory>${r"$"}{project.build.directory}</directory>
            <outputDirectory>/</outputDirectory>
            <includes>
                <include>${gen.genServer}.jar</include>
            </includes>
            <fileMode>0755</fileMode>
        </fileSet>
</#if>
    </fileSets>
</assembly>