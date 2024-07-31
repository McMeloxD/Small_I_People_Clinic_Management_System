<template>
  <div>

    <el-button type="primary">编辑药品信息</el-button>

    <el-form :model="drugInfo"  :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">

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
            <el-radio-group v-model="drugInfo.category" >
              <el-radio :label="1">西药</el-radio>
              <el-radio :label="2">中药</el-radio>
            </el-radio-group>
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
        <el-button type="primary" @click="submitEditForm('ruleForm')">立即创建</el-button>
        <el-button @click="resetEditForm('ruleForm')">重置</el-button>
        </span>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

  </div>
</template>
<script>
import {editDrug} from  '@/api/drug'
import row from 'element-ui/packages/row'
export default {
  name:'addDrug',
  data() {
    return {
      drugInfo:{
        // 序号
        id:null,
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
      rules: {
        medicineCoding: [
          { required: true, message: '请输入药品编码', trigger: 'blur' }
        ],

      }
    };
  },

  mounted() {
    // 从路由参数中获取数据
    this.drugInfo = { ...this.$route.query };
  },
  methods: {

    //   执行修改
    submitEditForm(formName) {
      // 处理保存逻辑，例如发送请求保存数据到服务器
      console.log(this.drugInfo);
      // 开启表单校验,找到formName        如果校验通过就 validate有效的
      this.$refs[formName].validate((valid) => {
        // 如果校验通过就执行提交
        if (valid) {
          // this.drugInfo = row;
          // 在此处执行添加
          editDrug(this.drugInfo).then(res => {
            this.$message({
              type: 'success',
              message: '修改成功!'
            })
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
    resetEditForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
  // mounted() {
  //   this.fetchData()
  // }
}
</script>
