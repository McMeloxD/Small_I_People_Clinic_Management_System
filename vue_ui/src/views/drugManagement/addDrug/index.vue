<template>
  <div>

    <el-button type="primary">添加药品信息</el-button>

    <el-form :model="drugInfo" :inline="true" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">

      <el-row>
        <el-col :span = "6">

          <el-form-item label="药品编码" prop="medicineCoding">
            <el-input v-model="drugInfo.medicineCoding"/>
          </el-form-item>
        </el-col>

          <el-col :span = "6">
          <el-form-item label="药品名称" prop="medicineName">
            <el-input v-model="drugInfo.medicineName"/>
          </el-form-item>
        </el-col>

        <el-col :span=6>
      <el-form-item label="药品规格" prop="specification">
        <el-input v-model="drugInfo.specification"/>
      </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span = "6">
      <el-form-item label="处方类别" prop="category">
        <el-select v-model="drugInfo.category" placeholder="请选择活动区域">
          <el-option label="西药" value=1></el-option>
          <el-option label="中药" value=2></el-option>
        </el-select>
      </el-form-item>
        </el-col>
          <el-col :span = "6">
      <el-form-item label="采购价格" prop="purchasePrice">
        <el-input v-model="drugInfo.purchasePrice"/>
      </el-form-item>
        </el-col>
          <el-col :span = "6">
      <el-form-item label="售药价格" prop="sellPrice">
        <el-input v-model="drugInfo.sellPrice"/>
      </el-form-item>
          </el-col>
      </el-row>
      <el-row>
        <el-col :span = "6">
      <el-form-item label="药品剂型" prop="medicineType">
          <el-select v-model="drugInfo.medicineType" placeholder="选择剂型">
            <el-option label="注射" value=1></el-option>
            <el-option label="口服" value=2></el-option>
            <el-option label="外用" value=3></el-option>
          </el-select>
      </el-form-item>
        </el-col>
        <el-col :span = "6">
      <el-form-item label="生产厂家" prop="manufacturers">
        <el-input v-model="drugInfo.manufacturers"></el-input>
      </el-form-item>
        </el-col>
        <el-col :span = "8">
        <el-form-item label="创建时间" prop="createTime" required>
            <el-form-item prop="date1">
              <el-date-picker type="date" placeholder="选择日期" v-model="drugInfo.createTime" style="width: 100%;"></el-date-picker>
            </el-form-item>
        </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span = "8">
        <el-form-item label="OTC" prop="OTCMedicine">
          <el-select v-model="drugInfo.OTCMedicine" placeholder="是否是OTC">
            <el-option label="是" value=1></el-option>
            <el-option label="否" value=2></el-option>
          </el-select>
        </el-form-item>
        </el-col>

        <el-col :span = "6">
      <el-form-item >
        <span  >
        <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
        </span>
      </el-form-item>
        </el-col>
      </el-row>
    </el-form>

  </div>
</template>
<script>
import {addDrug} from  '@/api/drug'
export default {
  name:'addDrug',
  data() {
    return {
      drugInfo:{
        // 序号
        id:'',
        // 药品编码
        medicineCoding:'',
        // 药品名称
        medicineName:'',
        // 规格
        specification:'',
        // 处方类别
        category:'',
        //采购价
        purchasePrice:'',
        //   售药价
        sellPrice:'',
        //   生产厂家
        manufacturers:'',
        //   药品状态
        medicineState:'',
        //   创建时间
        createTime:'',
      //   药品剂型
        medicineType:'',
      //   是否是OTC
        OTCMedicine:'',

      },
      rules: {
        medicineCoding: [
          { required: true, message: '请输入药品编码', trigger: 'blur' }
        ],
        category: [
          { required: true, message: '请选择处方类别', trigger: 'change' }
        ],

        specification: [
          { required: true, message: '请输入药品规格', trigger: 'blur' }
        ],

        medicineType: [
          {  required: true, message: '选择剂型', trigger: 'change' }
        ],

        medicineName: [
          {  required: true, message: '输入药品名称', trigger: 'blur' }
        ]
      }
    };
  },
  methods: {
      //   执行新增
      submitForm(formName) {
        // 开启表单校验,找到formName        如果校验通过就 validate有效的
        this.$refs[formName].validate((valid) => {
          // 如果校验通过就执行提交
          if (valid) {
            // 在此处执行添加
            addDrug(this.drugInfo).then(res => {
              this.$message({
                type: 'success',
                message: '添加成功!'
              })
              // 重新查询
              this.fetchData();
              // 重置表单
              this.$refs[formName].resetFields();
            })

          }
          // 校验不通过就报错
          else {
            console.log('error submit!!');
            // 表单不提交
            return false;
          }
        })
      },
    // 重置表单按钮
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  mounted() {
    this.fetchData()
  }
}
</script>
