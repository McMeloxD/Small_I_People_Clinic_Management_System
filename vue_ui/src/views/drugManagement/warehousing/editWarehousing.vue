<template>
  <div>
    <el-form-item :inline="true">
    <el-button type="primary">编辑入库信息</el-button>
    <el-button type="primary" @click="submitEditForm('ruleForm')">审核通过</el-button>
    <el-button @click="resetEditForm('ruleForm')">审核不通过</el-button>
    <el-button @click="resetEditForm('ruleForm')">返回</el-button>
    </el-form-item>


  </div>
</template>

<script>
export default {
  data() {
    return {
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
        // 搜索查询字段
        searchQuery: null
      }
    }
  },
  methods: {},
  mounted() {
    console.log("钩子函数执行")
  }
}
</script>
