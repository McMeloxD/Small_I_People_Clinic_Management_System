<template>
  <div>
    <el-form :inline="true" :model="details" ref="details" :rules="detailsRules" class="demo-form-inline"
             label-position="top"
    >
      <div id="a">
        <el-form-item>
          <el-button type="info" @click="downloadExcel" size="small" icon="el-icon-download">导出药品信息</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="warning" @click="charge('details')" size="small" icon="el-icon-sell">收费</el-button>
        </el-form-item>
      </div>

      <div id="b">
        <el-form-item label="患者姓名" prop="patientName">
          <el-input v-model="details.patientName" placeholder="请输入患者姓名" style="width:280px"></el-input>
        </el-form-item>
        <el-form-item label="患者卡号" prop="patientCard">
          <el-input v-model="details.patientCard" placeholder="请输入患者卡号" style="width:280px"></el-input>
        </el-form-item>
        <el-form-item label="患者年龄" prop="patientAge">
          <el-input v-model="details.patientAge" placeholder="请输入患者年龄" style="width:280px"></el-input>
        </el-form-item>
        <el-form-item label="出生日期" prop="dob">
          <el-date-picker
            v-model="details.dob"
            type="date"
            placeholder="选择日期" style="width:280px"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="性别" prop="patientSex">
          <el-select v-model="details.patientSex" placeholder="请选择性别" style="width:280px">
            <el-option label="男" value="1"></el-option>
            <el-option label="女" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="手机号码" prop="patientContact">
          <el-input v-model="details.patientContact" placeholder="请输入手机号码" style="width:280px"></el-input>
        </el-form-item>
        <el-form-item label="证件号码" prop="idCardNum">
          <el-input v-model="details.idCardNum" placeholder="请输入证件号码" style="width:280px"></el-input>
        </el-form-item>
      </div>

      <el-card class="box-card">
        <h1 id="c">药品信息</h1>
        <el-table
          :data="medicineList"
          stripe
          style="width: 100%"
        >
          <el-table-column prop="id" label="序号" width="60"></el-table-column>
          <el-table-column prop="medicineCoding" label="药品编码" width="100"></el-table-column>
          <el-table-column prop="medicineName" label="药品名称" width="100"></el-table-column>
          <el-table-column prop="specification" label="药品规格" width="100"></el-table-column>
          <el-table-column prop="buyNum" label="数量" width="60"></el-table-column>
          <el-table-column prop="unit" label="单位" width="60"></el-table-column>
          <el-table-column prop="sellPrice" label="单价" width="70"></el-table-column>
          <el-table-column prop="sellPrice" label="总价" width="70"></el-table-column>

          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="danger" icon="el-icon-delete"
                @click="handleDelete(scope.row)"
              ></el-button>
            </template>
          </el-table-column>
        </el-table>
        <div id="d">
          <el-button type="success" @click="addDrug" icon="el-icon-circle-plus-outline">添加药品</el-button>
        </div>

        <div id="f">
          <hr>
          <!--          <el-button size="small" type="success" @click="handleAddFee" icon="el-icon-circle-plus-outline">附加费用</el-button>-->
          <span style="font-size: 12px" id="e">操作员:</span>
          <el-select v-model="details.operator" placeholder="请选择操作员" size="small">
            <el-option label="张三" value="张三"></el-option>
            <el-option label="李四" value="李四"></el-option>
          </el-select>
        </div>
      </el-card>
    </el-form>

    <div id="g">
      <h3>药品销售排行</h3>
      <el-table :data="sortList" style="width: 100%">
        <el-table-column prop="medicineCoding" label="药品编码" width="80"></el-table-column>
        <el-table-column prop="medicineName" label="药品名称" width="150"></el-table-column>
        <el-table-column prop="sellNum" label="销售数量" width="110"></el-table-column>
      </el-table>
    </div>

    <!--    <el-dialog title=附加费用 :visible.sync="dialogTableVisible1" width="28%">-->
    <!--      <el-table-->
    <!--        ref="multipleTable"-->
    <!--        :data="addFee"-->
    <!--        tooltip-effect="dark"-->
    <!--        style="width: 100%"-->
    <!--        @selection-change="handleSelectionChange2">-->
    <!--        <el-table-column-->
    <!--          type="selection"-->
    <!--          width="55">-->
    <!--        </el-table-column>-->
    <!--        <el-table-column prop="id" label="序号" width="60"></el-table-column>-->
    <!--        <el-table-column prop="additionType" label="项目费用" width="100"></el-table-column>-->
    <!--        <el-table-column prop="additionNum" label="数量" width="60"></el-table-column>-->
    <!--        <el-table-column prop="additionPrice" label="价格" width="80"></el-table-column>-->
    <!--      </el-table>-->
    <!--      <div id="h">-->
    <!--      <el-button @click="cancel2" size="small" icon="el-icon-sel">取消</el-button>-->
    <!--      <el-button type="primary" @click="transmit" size="small" icon="el-icon-sel">添加</el-button>-->
    <!--      </div>-->
    <!--    </el-dialog>-->

    <el-dialog title="选择药品" :visible.sync="dialogTableVisible2" width="55%">

      <el-form :inline="true" :model="keyword" ref="selectDrug" class="demo-form-inline">
        <el-form-item label="处方类别" prop="category">
          <el-select v-model="keyword.category" placeholder="请选择处方类别" clearable size="small">
            <el-option label="中药" value="1"></el-option>
            <el-option label="西药" value="2"></el-option>
          </el-select>
          <el-form-item prop="medicineName" style="margin-left: 30px">
            <el-input v-model="keyword.medicineName" placeholder="请输入药品名称" clearable size="small"></el-input>
          </el-form-item>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="search" icon="el-icon-search" size="small">查询</el-button>
          <el-button type="primary" @click="resetForm('selectDrug')" icon="el-icon-refresh" size="small">重置</el-button>
          <el-button type="primary" @click="upload" icon="el-icon-upload2" size="small">导入</el-button>
        </el-form-item>
      </el-form>

      <el-table
        height="250"
        ref="multipleTable"
        :data="medicine"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="handleSelectionChange"
      >
        <el-table-column
          type="selection"
          width="55"
        >
        </el-table-column>
        <el-table-column property="id" label="序号" width="60"></el-table-column>
        <el-table-column property="medicineCoding" label="药品编码" width="80"></el-table-column>
        <el-table-column property="medicineName" label="药品名称" width="100"></el-table-column>
        <el-table-column property="category" label="处方类别" width="80">
          <template slot-scope="scope">
            <span>{{ scope.row.category == '1' ? '中药' : '西药' }}</span>
          </template>
        </el-table-column>
        <el-table-column property="specification" label="规格" width="90"></el-table-column>
        <el-table-column property="manufacturers" label="厂家" width="140"></el-table-column>
        <el-table-column property="repertoryNum" label="库存" width="70"></el-table-column>
        <el-table-column property="sellPrice" label="零售价格(元)" width="100"></el-table-column>
      </el-table>
      <div id="i">
        <el-button @click="cancel('selectDrug')" size="small" icon="el-icon-sel">取消</el-button>
        <el-button type="primary" @click="addMedicine" size="small" icon="el-icon-sel">添加</el-button>
      </div>
    </el-dialog>

    <el-dialog title="上传药品信息" :visible.sync="dialogTableVisible3" width="27%">

      <el-upload
        class="upload-demo"
        drag
        action="http://localhost:9999/details/upload"
        accept=".xlsx,.xls"
        :on-success="uploadExcelSuccess"
        :on-error="uploadExcelError"
        multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>

    </el-dialog>

  </div>
</template>

<script>
import { findAllAddFee, sort, getList, addTemDrug, findAllTemDrug, delTemDrug, addTemPatient } from '@/api/details'

export default {
  name: 'index',
  data() {
    return {
      details: {
        patientName: '',
        patientCard: '',
        patientAge: null,
        dob: null,
        patientSex: null,
        patientContact: null,
        idCardNum: null,
        operator: null
      },
      medicineList: [],
      sortList: [],
      addFee: [],
      medicine: [],
      medicineList2: [],
      addFeeList: [],
      multipleSelection: [],
      // multipleSelection2:[],
      dialogTableVisible1: false,
      dialogTableVisible2: false,
      dialogTableVisible3: false,
      keyword: {
        category: null,
        medicineName: null
      },
      detailsRules: {
        patientName: [
          { required: true, message: '请输入患者项目', trigger: 'blur' }
        ],
        patientCard: [
          { required: true, message: '请输入患者卡号', trigger: 'blur' }
        ],
        patientAge: [
          { required: true, message: '请输入患者年龄', trigger: 'blur' }
        ],
        dob: [
          { required: true, message: '请输入患者出生日期', trigger: 'blur' }
        ],
        patientSex: [
          { required: true, message: '请输入患者性别', trigger: 'blur' }
        ],
        patientContact: [
          { required: true, message: '请输入患者联系方式', trigger: 'blur' }
        ],
        idCardNum: [
          { required: true, message: '请输入患者身份证号', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    downloadExcel(){
      this.$confirm('确定要导出数据吗？','信息',{
        confirmButtonText:'确定',
        cancelButtonText:'取消',
      }).then(()=>{
        window.location.href="http://localhost:9999/details/download"
      }).catch(()=>{
        this.$message({
          type:'info',
          message:'取消导出数据！',
          duration:1000
        })
      })
    },
    uploadExcelSuccess(){
      this.$message({
        type:'success',
        message:"上传成功",
        duration:1000
      })
      this.dialogTableVisible3 = false;
      this.Drug();
      this.sort();
    },
    uploadExcelError(){
      this.$message({
        type:'error',
        message:"上传失败",
        duration:1000
      })
    },
    upload() {
      this.dialogTableVisible3 = true
    },
    handleAddFee() {
      this.dialogTableVisible1 = true
      findAllAddFee().then(res => {
        console.log(res)
        this.addFee = res.data
      })
    },
    order() {
      this.$router.push('/order')
    },
    sort() {
      sort().then(res => {
        this.sortList = res.data
      })
    },
    Drug() {
      let params = {
        category: this.keyword.category,
        medicineName: this.keyword.medicineName
      }
      getList(params).then(res => {
        this.medicine = res.data
      })
    },
    addDrug() {
      this.dialogTableVisible2 = true
      this.Drug()
    },
    search() {
      this.Drug()
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
      this.Drug()
    },
    cancel(formName) {
      this.$refs[formName].resetFields()
      this.dialogTableVisible2 = false
    },
    cancel2() {
      this.dialogTableVisible1 = false
    },
    handleSelectionChange(selection) {
      this.medicineList2 = []
      this.multipleSelection = selection
      // console.log(this.multipleSelection)
      for (let i = 0; i < this.multipleSelection.length; i++) {
        let medicine = this.multipleSelection[i]
        this.medicineList2.push(medicine)
      }
      // console.log(this.medicineList2)
    },
    AllTemDrug() {
      findAllTemDrug().then(res => {
        this.medicineList = res.data
        console.log(this.medicineList)
      })
    },
    addMedicine() {
      for (let i = 0; i < this.medicineList2.length; i++) {
        let medicine = this.medicineList2[i]
        addTemDrug(medicine).then(() => {
        })
      }
      this.AllTemDrug()
      this.dialogTableVisible2 = false
      this.AllTemDrug()
    },
    handleDelete(row) {
      delTemDrug(row.id).then(() => {
      })
      this.AllTemDrug()
      this.AllTemDrug()
    },
    charge(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          addTemPatient(this.details).then(res => {
            if (res.code == 20000) {
              this.$message({
                type: 'success',
                message: '保存成功',
                duration: 1000
              })
            }
            this.$router.push('/charge')
          })
        } else {
          this.$message({
            type: 'error',
            message: '数据不正确',
            duration: 1000
          })
        }
      })

    },
    handleSelectionChange2(selection) {
      this.addFeeList = selection
      console.log(this.addFeeList)
    }

  },

  created() {
    this.sort()
  }
}
</script>

<style scoped>

.box-card {
  margin-left: 30px;
  width: 800px;
  /*height: 500px;*/
}

#a {
  margin-top: 5px;
  text-align: right;
}

#b {
  margin-top: -25px;
  margin-left: 50px;
}

#c {
  margin-top: 0px;
}

#d {
  margin-top: 5px;
  text-align: center;
}

#e {
  margin-left: 10px;
}

#f {
  width: 750px;
  margin-bottom: 10px;
}

#g {
  position: absolute;
  top: 280px;
  right: 70px;
}

#h {
  text-align: right;
  margin-top: 5px;
}

#i {
  text-align: right;
  margin-top: 5px;
}
</style>
