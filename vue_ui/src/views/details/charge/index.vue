<template>
  <div>
  <el-card class="top-card">
    <div id="a">
      <el-button type="warning" @click="end" icon="el-icon-sell">收费</el-button>
      <el-button type="info" @click="back" icon="el-icon-back">返回</el-button>
  </div>
  </el-card>

    <el-card class="right-card">
      <h2>人员信息</h2>
      <el-table
        :data="patient"
        style="width: 100%">
        <el-table-column prop="id" label="患者编号" width="120"> </el-table-column>
        <el-table-column prop="patientName" label="患者姓名" width="120"> </el-table-column>
        <el-table-column prop="idCardNum" label="身份证号" width="140"> </el-table-column>
        <el-table-column prop="patientAge" label="年龄" width="100"> </el-table-column>
        <el-table-column prop="patientSex" label="性别" width="100">
          <template slot-scope="scope">
              <span>{{ scope.row.patientSex== 1?'男':'女' }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="patientContact" label="手机" width="140"> </el-table-column>
        <el-table-column prop="patientCard" label="卡号" width="140"> </el-table-column>

      </el-table>
    </el-card>

  <el-card class="left-card">
    <h2>项目明细</h2>
    <el-table
      :data="charge"
      style="width: 100%">
      <el-table-column prop="id" label="序号" width="100"> </el-table-column>
      <el-table-column prop="medicineName" label="药品名称" width="140"> </el-table-column>
      <el-table-column prop="sellPrice" label="单价(元)" width="100"> </el-table-column>
      <el-table-column prop="buyNum" label="数量" width="80"> </el-table-column>
      <el-table-column prop="unit" label="单位" width="90"> </el-table-column>
    </el-table>
  </el-card>

    <el-card class="a-card">
      <p id="b">总计:{{num}}</p>
      <p id="c">操作员:{{operator}}</p>
    </el-card>

    <el-dialog title="收费" :visible.sync="dialogFormVisible" width="40%">
      <span>应收金额：{{num}}元</span>
      <div id="d">
      <el-form :model="proceeds" ref="proceeds" :rules="proceedsRules">
        <el-form-item label="实收金额" prop="money" :label-width="formLabelWidth">
          <el-input v-model="proceeds.money" autocomplete="off" style="width: 450px" placeholder="请输入实收金额"></el-input>
        </el-form-item>
                <el-form-item label="支付方式" label-width="formLabelWidth" prop="way">
                  <el-radio-group v-model="proceeds.way">
                    <el-radio :label="1">现金</el-radio>
                    <el-radio :label="2">支付宝</el-radio>
                    <el-radio :label="3">微信</el-radio>
                  </el-radio-group>
                </el-form-item>
        <el-form-item label="收款备注" :label-width="formLabelWidth">
          <el-input v-model="proceeds.remark" autocomplete="off" style="width: 450px" placeholder="请输入收款备注"></el-input>
        </el-form-item>
      </el-form>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel('proceeds')">取 消</el-button>
        <el-button type="primary" @click="yes('proceeds')">确定收款</el-button>
      </div>
    </el-dialog>
  </div>

</template>

<script>
import {findTemPat,findAllTemDrug,sum,clearDrug,clearInfo,sellDrug} from '@/api/charge'

export default {
  name: 'charge',
  data() {
    return {
      num:0,
      operator:null,
      patient:[],
      charge:[],
      drugNameList:[],
      dialogFormVisible :false,
      proceeds: {
        money:null,
        way:null,
        remark:null,
      },
      formLabelWidth: '80px',
      proceedsRules:{
        money:[
          {required: true, message: '请输入付款金额', trigger: 'blur'}
        ],
        way:[
          {required: true, message: '请选择付款方式', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    back(){
      if(this.num === 0) {
        this.$router.push('/details');
      }else {
        this.$message({
          type:"error",
          message:"未付款",
          duration:1000
        })
      }
    },
    fetchData(){
      findTemPat().then(res=>{
        this.patient = res.data;
        console.log(res.data)
        this.operator = res.data[0].operator;
      })
      findAllTemDrug().then(res=>{
        this.charge = res.data;
      })
      sum().then(res=>{
        this.num = res.data
      })
    },
    end(){
      this.dialogFormVisible = true;
    },
    yes(formName){
      this.$refs[formName].validate((valid)=>{
        if (valid){
          if(this.proceeds.money == this.num) {
            findAllTemDrug().then(res=>{
              // console.log("res",res)
              for (let i = 0; i < res.data.length; i++) {
                let drug = res.data[i];
                this.drugNameList.push(drug.medicineName);
              }
              const nameStr = this.drugNameList.join(",")
              sellDrug(nameStr).then(res=>{
                // this.$message({
                //   type: "success",
                //   message: "库存修改成功",
                //   duration: 1000
                // })
              })
            })
            clearInfo().then(() => {
            });
            clearDrug().then(res => {
              if (res.code == 20000) {
                this.$message({
                  type: "success",
                  message: "库存已修改,收费成功",
                  duration: 1000
                })
              }
            })
            this.$router.push('/details');
          }else {
            this.$message({
              type:'error',
              message:"金额错误",
              duration:1000
            })
          }
        }else {
          console.log('error submit!!');
          return false;
        }
      })

    },
    cancel(formName){
      this.$refs[formName].resetFields();
      this.dialogFormVisible = false;
    },
  },
  created() {
    this.fetchData()
  },

}
</script>

<style scoped>
.top-card {
  margin-top: 25px;
  margin-left: 100px;
  width: 1100px;
  height: 100px;
}
.left-card {
  margin-top: 10px;
  margin-left: 100px;
  width: 600px;

}
.right-card {
  margin-top: 10px;
  margin-left: 100px;
  width: 1100px;
}
.a-card {
  position: absolute;
  top: 340px;
  margin-top: 5px;
  margin-top: 10px;
  margin-left: 710px;
  width: 480px;
  /*height: 400px;*/
}
#a{
  text-align: right;
  margin-top: 10px;
}
#b{
  font-size: 80px;
}
#c{
  text-align: right;
  font-size: 35px;
}
#d{
  margin-top: 20px;
}
</style>
