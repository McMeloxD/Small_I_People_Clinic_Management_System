<template>
  <div>
    <!--    最上方按钮-->
    <el-card border-radius:5px>
      <el-row style="right: -960px">
        <el-button type="primary" round>编辑入库信息</el-button>
        <el-button type="primary" round @click="passAudit">审核通过</el-button>
        <el-button type="danger" round @click="failAudit">审核不通过</el-button>
        <el-button type="info" round @click="getBack">返回</el-button>
      </el-row>
    </el-card>

    <!--  添加入库信息卡片  -->
    <el-card border-radius:5px>
      <el-form :model="warehousingInfo" ref="ruleForm" label-width="100px" class="demo-ruleForm">

        <el-row>
          <el-col :span="6">
            <el-form-item label="入库编号" prop="warehousingOrder">
              <el-input v-model="warehousingInfo.warehousingOrder"/>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="创建日期" prop="createTime">
              <el-date-picker type="date" placeholder="选择日期" v-model="warehousingInfo.createTime"
                              style="width: 100%;"/>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="入库人员" prop="warehousingName">
              <el-select v-model="warehousingInfo.warehousingName">
                <el-option label="入库人员" value="1"></el-option>
              </el-select>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="入库类型" prop="type">
              <el-input v-model="warehousingInfo.type"/>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="6">
            <el-form-item label="供应商" prop="supplierName">
              <el-input v-model="warehousingInfo.supplierName"/>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="制单时间" prop="makeTime">
              <el-date-picker type="date" placeholder="选择日期" v-model="warehousingInfo.makeTime"
                              style="width: 100%;"/>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="制单人员" prop="makeName">
              <el-input v-model="warehousingInfo.makeName"/>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="备注" prop="text">
              <el-input v-model="text"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>

    <!--添加药品卡片-->
    <el-card border-radius:5px>
      <el-card border-radius:5px>
        <el-row style="right: -800px">
          <el-input v-model="drugInfo.medicineName" style="width: 290px" placeholder="药品名称" ></el-input>
          <el-button type="primary"  @click="search" icon="el-icon-circle-plus-outline"   size="medium" >查询</el-button>
          <el-button type="primary" @click="handleAdd" icon="el-icon-circle-plus-outline"   size="medium" >新增药品</el-button>
        </el-row>
      </el-card>
        <el-table :data="drugList"    @selection-change="handleSelectionChange"  style="width: 100%" height="600">
          <el-table-column type="selection" width="55"></el-table-column>
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

        </el-table>
          <!-- 分页组件   -->
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[5, 10, 20]"
            :page-size="100"
            layout="total,sizes,prev,pager,next,jumper"
            :total="total">
          </el-pagination>
    </el-card>
  </div>
</template>

<script>

import {getDrugList} from '@/api/drug'

export default {
  name: 'addWarehousing',
  // 制单时间

  data() {
    return {
      drugList:[],
      // 分页查询相关数据
      pageNum: 1,
      pageSize: 5,
      currentPage: 1,
      total: 0,
      // 备注
      text: null,
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
        //   药品剂型
        medicineType:null,
        //   是否是OTC
        OTCMedicine:null,
      },
      warehousingInfo: {
        // 序号
        id: null,
        // 入库单号
        warehousingOrder: null,
        // 入库类型
        type: null,
        // 供应商名称
        supplierName: null,
        // 制单人员
        makeName: null,
        // 采购金额
        procurementAmount: null,
        // 零售金额
        procurementRetail: null,
        // 入库人员
        warehousingName: null,
        // 创建时间
        createTime: null,
        // 审核状态
        reviewStatus: null,
        // 制单时间
        makeTime:null,
        // 搜索查询字段
        searchQuery: null
      }
    }
  },
  methods: {
    // 添加
    handleAdd(){},
    // 多选框选中数据
    handleSelectionChange(selectionRowArr) {
      // 设置空数组,来装选中的id
      this.ids = [];
      //遍历,把选中的id存进数组
      for (let i = 0; i < selectionRowArr.length; i++) {
        this.ids.push(selectionRowArr[i].warehousingOrder)
      }
    },
    // 获取药品的数据 ,查询全部
    fetchDrugData(){

      let params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        medicineName:this.drugInfo.medicineName
      }
      console.log("发出请求")
      getDrugList(params).then(res => {
        console.log(res)
        // 获取药品信息列表
        this.drugList = res.data;
      this.drugInfo =  res.data;
        console.log(this.drugList)
        console.log(this.drugInfo)
        let pageInfo = res.data;
// 页面总数
        this.total = pageInfo.total;
      })
    },
    // 模糊查询
    search(){
      this.fetchDrugData();
    },
    // 审核通过
    passAudit() {

    },
    // 审核不通过
    failAudit() {

    },
    // 返回上级页面
    getBack() {

    },  // 页面大小改变时触发
    handleSizeChange(val) {
      this.pageSize = val;
      this.fetchData();
    },
    // 页面改变时触发
    handleCurrentChange(val) {
      this.pageNum = val;
      this.fetchData();
    }
  },
  // 生命周期钩子函数(vue对象创建完,自动调用该方法)
  created() {
    this.fetchDrugData()
  }
}
</script>
