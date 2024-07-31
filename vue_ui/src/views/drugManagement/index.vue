<!--药品管理-->
<template>
<div>
<!--  上方搜索框-->
  <el-form :inline="true" :model="drugInfo" ref="searchForm" class="demo-form-inline">
    <el-form-item label="处方类别" prop="category">
      <el-select v-model="drugInfo.category"  placeholder="全部">
        <el-option label="全部" value=0></el-option>
        <el-option label="中药" value=1></el-option>
        <el-option label="西药" value=2></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="药品状态" prop="medicineState">
      <el-select v-model="drugInfo.medicineState" placeholder="全部" >
        <el-option label="全部" value=0></el-option>
        <el-option label="启用" value=1></el-option>
        <el-option label="禁用" value=2></el-option>
      </el-select>
    </el-form-item>
    <el-form-item prop="medicineName"  >
      <el-input v-model="drugInfo.medicineName" style="width: 290px" placeholder="药品名称" ></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="search"  size="medium">查询</el-button>
      <el-button type="primary" plain  @click="resetSearchForm('searchForm')" icon="el-icon-refresh"  size="medium">重置</el-button>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="handleAdd" icon="el-icon-circle-plus-outline"   size="medium" >新增药品</el-button>

    </el-form-item>
  </el-form>

<!--  中间表格信息-->
  <el-table :data="drugList"  style="width: 100%" height="600">
    <el-table-column fixed prop="id" label="序号" width="80"></el-table-column>
    <el-table-column prop="medicineCoding" label="药品编码" width="80"></el-table-column>
    <el-table-column prop="medicineName" label="药品名称" width="140"></el-table-column>
    <el-table-column prop="specification" label="规格" width="140"></el-table-column>
    <el-table-column prop="category" label="处方类别" width="100">
      <!--         卡槽,判断-->
      <template slot-scope="scope">
        <el-tag :type="scope.row.category == '1'?'':'success'">
          <span>{{ scope.row.category == '1' ? '西药' : '中药' }}</span></el-tag>
      </template>
    </el-table-column>

    <el-table-column prop="purchasePrice" label="采购价" width="80"></el-table-column>
    <el-table-column prop="sellPrice" label="售药价" width="80"></el-table-column>
    <el-table-column prop="manufacturers" label="生产厂家" width="150"></el-table-column>
    <el-table-column prop="medicineState" label="药品状态" width="80">
      <!--         卡槽,判断-->
      <template slot-scope="scope">
        <el-tag :type="scope.row.medicineState == '1'?'':'danger'">
          <span>{{ scope.row.medicineState == '1' ? '启用' : '停用' }}</span></el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="createTime" label="创建时间" width="120"></el-table-column>
    <el-table-column  label="操作" width="140">
      <template slot-scope="scope">
        <el-button
          size="mini"
          type="text"
          icon="el-icon-edit"
          @click="handleAlter(scope.row)"
        >编辑</el-button>
        <el-button
          size="mini"
          type="text"
          icon="el-icon-delete"
          @click="handleDel(scope.row)"
        >删除</el-button>
      </template>
    </el-table-column>
  </el-table>
<!--  &lt;!&ndash; 分页组件   &ndash;&gt;-->
<!--  <el-pagination-->
<!--    @size-change="handleSizeChange"-->
<!--    @current-change="handleCurrentChange"-->
<!--    :current-page="currentPage"-->
<!--    :page-sizes="[5, 10, 20]"-->
<!--    :page-size="100"-->
<!--    layout="total,sizes,prev,pager,next,jumper"-->
<!--    :total="total">-->
<!--  </el-pagination>-->
</div>
</template>


<script>
//导入自己封装的api请求
import {getDrugList,delById} from '@/api/drug'

export default {
naem:"drugManagement",

  data() {
    return {
      // 分页查询相关数据
      pageNum: 1,
      pageSize: 5,
      currentPage: 1,
      total: 0,
      drugList:[],
      drugInfo:{
        // 序号
        id:'',
        // 药品编码
        medicineCoding:null,
        // 药品名称
        medicineName:null,
        // 规格
        specification:null,
        // 处方类别
        category:null,
       //采购价
       purchasePrice:null,
      //   售药价
        sellPrice:null,
      //   生产厂家
        manufacturers:null,
      //   药品状态
        medicineState:null,
      //   创建时间
        createTime:null,

      }
    }
  },
  methods: {
    // 获取药品的数据 ,查询全部
fetchData(){
  let params = {
    pageNum: this.pageNum,
    pageSize: this.pageSize,
    category:this.drugInfo.category,
    medicineState:this.drugInfo.medicineState,
    medicineName:this.drugInfo.medicineName,
  }
  console.log("发出请求")
  getDrugList(params).then(res => {
    // 获取药品信息列表
    this.drugList = res.data;
    console.log(this.drugList)
let pageInfo = res.data;
// 页面总数
this.total = pageInfo.total;
  })
},
    // 搜索框查询按钮查询 模糊查询
    search(){
    this.fetchData();

    },
    // 重置查询窗口
    resetSearchForm(formName) {
      this.$refs[formName].resetFields();
      this.fetchData()
    },
    // 修改编辑
    handleAlter(row){

  this.$router.push({path:'/editDrug',query:{...row}})
    },
    // 添加
    handleAdd(){
this.$router.push('/addDrug')
    },
    // 删除
    handleDel(row){
    // 提示框
      this.$confirm('是否确认删除单位编号为' + row.medicineCoding + '的数据项？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(()=>{
        let params = {
          id:row.id
        }
        delById(params).then(res => {
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
          this.fetchData();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    // // 页面大小改变时触发
    // handleSizeChange(val) {
    //   this.pageSize = val;
    //   this.fetchData();
    // },
    // // 页面改变时触发
    // handleCurrentChange(val) {
    //   this.pageNum = val;
    //   this.fetchData();
    // }
  },
mounted() {
  this.fetchData()
}
}
</script>

