<template>
  <div>
    <el-card class="box-card">
      <div>
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="110px" class="demo-ruleForm" :inline="true">
          <el-form-item label="姓名" prop="patientName">
            <el-input v-model="ruleForm.patientName" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="订单类型" prop="orderType">
            <el-select v-model="ruleForm.orderType" placeholder="请选择订单类型">
              <el-option label="药品零售" value="药品零售"></el-option>
              <el-option label="处方开立" value="处方开立"></el-option>
              <el-option label="挂号" value="挂号"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="性别" prop="patientSex">
            <el-select v-model="ruleForm.patientSex" placeholder="性别">
            <el-option label = "男"  value="1"></el-option>
            <el-option label = "女" value="2"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="年龄" prop="patientAge">
            <el-input v-model="ruleForm.patientAge" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="联系方式" prop="patientContact">
            <el-input v-model="ruleForm.patientContact" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="科室" prop="department">
            <el-input v-model="ruleForm.department" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="接诊医生" prop="doctorName">
            <el-input v-model="ruleForm.doctorName" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="应收金额(元)" prop="amountReceivable">
            <el-input v-model="ruleForm.amountReceivable" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="实收金额(元)" prop="receiveAmount">
            <el-input v-model="ruleForm.receiveAmount" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item label="支付方式" prop="paymentMethod">

            <el-select v-model="ruleForm.paymentMethod" placeholder="请选择支付方式">
              <el-option label= "现金" value="1"></el-option>
              <el-option label= "支付宝" value="2"></el-option>
              <el-option label= "微信" value="3"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="收费状态" prop="chargingState">
            <el-select v-model="ruleForm.chargingState" placeholder="请选择收费状态">
              <el-option label= "待收费" value="1"></el-option>
              <el-option label= "已收费" value="2"></el-option>
              <el-option label= "已退费" value="3"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="退费金额" prop="returnFee">
            <el-input v-model="ruleForm.returnFee" style="width: 205px"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
  </div>

</template>

<script>
import {getAdd} from "@/api/all";
export default {
  data() {
    return {
      ruleForm: {
        orderType:'',
        patientName:'',
        patientSex:'',
        patientAge:'',
        patientContact:'',
        department:'',
        doctorName:'',
        amountReceivable:'',
        receiveAmount:'',
        paymentMethod:'',
        chargingState:'',
        returnFee:'',
      },
      //表单校验
      rules: {
        patientName: [
          { required: true, message: '请填写姓名', trigger: 'blur' },
          { min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur' }
        ],
        orderType: [
          { required: true, message: '请选择订单类型', trigger: 'change' }
        ],
        patientSex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        patientAge: [
          { required: true, message: '请填写年龄', trigger: 'change' }
        ],
        patientContact: [
          { required: true, message: '请填写联系方式', trigger: 'change' }
        ],
        department: [
          { required: true, message: '请填写科室', trigger: 'change' }
        ],
        doctorName: [
          { required: true, message: '请填写接诊医生姓名', trigger: 'change' }
        ],
        amountReceivable: [
          { required: true, message: '请填写应收金额(元)', trigger: 'blur' }
        ],
        receiveAmount: [
          { required: true, message: '请填写实收金额(元)', trigger: 'blur' }
        ],
        paymentMethod: [
          { required: true, message: '请填写支付方式', trigger: 'blur' }
        ],
        chargingState: [
          { required: true, message: '请填写收费状态', trigger: 'blur' }
        ]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          getAdd(this.ruleForm).then(res => {
            if (res.code == 20000) {
              this.$message({
                type: 'success',
                message: '添加成功!',
                duration: 1000
              });
            }
            this.$router.push('/aa')
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    //重置
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}
</script>

<style scoped lang="scss">
//.box-card {
//  position: absolute;
//  top: 30px;
//  left: 280px;
//  width: 700px;
//}
</style>
