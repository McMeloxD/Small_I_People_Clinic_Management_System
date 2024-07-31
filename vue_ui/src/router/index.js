import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '首页', icon: 'el-icon-s-home' }
    }]
  },



  {
    path: '/statement',
    component: Layout,
    children: [
      {
        path: '/statement',
        name: 'Statement',
        component: () => import('@/views/statement/statement/index'),
        meta: { title: '报表', icon: 'el-icon-suitcase' },
      },
    ]
  },

// 李悦先 >>>挂号记录
  {
    path: '/guahao',
    component: Layout,
    meta: { title: '挂号', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'guaHaoInfo',
        name: 'guaHaoInfo',
        component: () => import('@/views/guahao/addGuahao'),
        meta: { title: '挂号记录', icon: 'tree' },
      }
    ]
  },

  {
    path: '/form',
    component: Layout,
    children: [
      {
        path: '/details',
        name: 'Details',
        component: () => import('@/views/details/details/index'),
        meta: { title: '药品零售', icon: 'el-icon-suitcase' },
      },
      {
        path: '/charge',
        component: () => import('@/views/details/charge'),
        name: 'Charge',
        meta: { title: '收费' },
        hidden: true,
      },

    ]
  },



  // 崔新科charge路由
  {
    path: '/nested',
    component: Layout,
    redirect: '/nested/menu2',
    name: 'Nested',
    meta: {
      title: '收费管理',
      icon: 'el-icon-edit-outline'
    },
    children: [
      {
        path: '/aa',
        component: () => import('@/views/nested/menu1/index'),
        name: 'Menu1',
        meta: { title: '待收费' },
      },
      {
        path: '/add',
        name: 'add',
        component: () => import('@/views/nested/add/index.vue'),
        hidden: true
      },
      {
        path: 'menu2',
        component: () => import('@/views/nested/menu2/index'),
        name: 'Menu2',
        meta: { title: '已收费' }
      },
      {
        path: 'menu3',
        component: () => import('@/views/nested/menu3/index'),
        name: 'Menu3',
        meta: { title: '已退费' }
      }
    ]
  },


  {
    path: '/gongying',
    component: Layout,
    name: 'gongYing',
    meta: {
      title: '供应商管理',
      icon: 'el-icon-s-platform'
    },
    children: [
      {
        path: 'supplier',
        component: () => import('@/views/gongying/supplier/index.vue'),
        name: 'Menu3',
        meta: { title: '供应商管理' }
      },
      {
        path: 'supplier1',
        component: () => import('@/views/gongying/index.vue'),
        name: 'Menu3',
        meta: { title: '饼状图' }
      },
      {
        path: 'tupian',
        component: () => import('@/views/gongying/tupian/index.vue'),
        name: 'Menu3',
        meta: { title: '上传文件' }
      },
    ]
  },

  {
    path: '/reservation',
    component: Layout,
    name: 'reservation',
    meta: {
      title: '预约管理',
      icon: 'el-icon-s-platform'
    },
    children: [
      {
        path: 'reservation',
        component: () => import('@/views/reservation/index.vue'),
        name: 'Reservation',
        meta: { title: '预约管理' }
      }
    ]
  },


  // 王文杰的药品管理路由
  {
    path:"/drugManagement",
    component: Layout,
    meta: {
      title: '药品管理',
      icon: 'el-icon-s-help'
    },
    children: [
      {
        name: 'drugManagement',
        path: '/index',
        component: () => import('@/views/drugManagement/index'),
        meta: {
          title: '药品信息维护',
          icon: 'el-icon-s-help'
        }
      },
      {
        name: 'addDrug',
        path: '/addDrug',
        component: () => import('@/views/drugManagement/addDrug'),
       hidden: true
      },
      {
        name: 'editDrug',
        path: '/editDrug',
        component: () => import('@/views/drugManagement/editDrug'),
        hidden: true
      },
      {
        name: 'warehousing',
        path: '/warehousing',
        component: () => import('@/views/drugManagement/warehousing/index'),
        meta: {
          title: '入库管理',
          icon: 'el-icon-s-help'
        }
      },
      {
        name: 'editWarehousing',
        path: '/editWarehousing',
        component: () => import('@/views/drugManagement/warehousing/editWarehousing'),
        hidden: true
      },
      {
        name: 'checkWarehousing',
        path: '/checkWarehousing',
        component: () => import('@/views/drugManagement/warehousing/checkWarehousing.vue'),
        hidden: true
      },
      {
        name: 'addWarehousing',
        path: '/addWarehousing',
        component: () => import('@/views/drugManagement/warehousing/addWarehousing.vue'),
        hidden: true
      },

      // {
      //   name: 'drugManagement',
      //   path: '/index',
      //   component: () => import('@/views/drugManagement/index'),
      //   meta: {
      //     title: '出库管理',
      //     icon: 'el-icon-s-help'
      //   }
      // },{
      //   name: 'drugManagement',
      //   path: '/index',
      //   component: () => import('@/views/drugManagement/index'),
      //   meta: {
      //     title: '库存管理',
      //     icon: 'el-icon-s-help'
      //   }
      // },{
      //   name: 'drugManagement',
      //   path: '/index',
      //   component: () => import('@/views/drugManagement/index'),
      //   meta: {
      //     title: '库存盘点',
      //     icon: 'el-icon-s-help'
      //   }
      // },{
      //   name: 'drugManagement',
      //   path: '/index',
      //   component: () => import('@/views/drugManagement/index'),
      //   meta: {
      //     title: '药品调价',
      //     icon: 'el-icon-s-help'
      //   }
      // },
    ],
  },

  // 刘兵的患者管理路由
  {
    path: '/patient',
    name: 'Patient',
    component: Layout,
    redirect: '/patient/user',
    meta: { title: '患者管理', icon: 'el-icon-s-custom' },
    children: [
      {
        path: 'user',
        name: 'User',
        component: () => import('@/views/patient/user/indext'),
        meta: { title: '患者管理', icon: 'el-icon-apple' }
      },
      {
        path: 'family',
        name: 'Family',
        component: () => import('@/views/patient/family/indext'),
        meta: { title: '家庭关系', icon: 'el-icon-grape' },
        // //将子菜单隐藏
        hidden: true,
      },
    ]
  },

  // 刘兵的设置管理
  {
    path: '/setting',
    name: 'Setting',
    component: Layout,
    redirect: '/setting/employees',
    meta: { title: '团队管理', icon: 'el-icon-potato-strips' },

    children: [
      {
        path: 'employees',
        name: 'Employees',
        component: () => import('@/views/setting/employees/indext'),
        meta: { title: '员工管理', icon: 'el-icon-apple' },
        hidden: true,
      },
      {
        path: 'departments',
        name: 'Departments',
        component: () => import('@/views/setting/departments/indext'),
        meta: { title: '科室管理', icon: 'el-icon-s-home' },
        hidden: true,
      },
      {
        path: 'roles',
        name: 'Roles',
        component: () => import('@/views/setting/roles/indext'),
        meta: { title: '角色管理', icon: 'el-icon-user' },
        hidden: true,
      },
      {
        path: 'txEmployees',
        name: 'TxEmployees',
        component: () => import('@/views/setting/txEmployees/indext'),
        meta: { title: '图像', icon: 'el-icon-user' },
        hidden: true,
      },
    ]
  },

  {
    path: '/log',
    component: Layout,
    name: 'Log',
    meta: {
      title: '登录日志',
      icon: 'el-icon-edit-outline'
    },
    children: [
      {
        path: '/log',
        component: () => import('@/views/log/index.vue'),
        meta: { title: '操作日志' }
      }
    ]
  },

  // 系统设置
  {
    path: '/profile',
    component: Layout,
    redirect: '/profile/editProfile',
    meta: {
      title: '系统设置',
      icon: 'el-icon-setting'
    },
    children: [
      {
        path: '/editProfile',
        component: () => import('@/views/profile/index'),
        name: 'editProfile',
        meta: { title: '个人信息' ,icon: 'el-icon-user'},
      },
      {
        path: '/editpwd',
        name: 'editpwd',
        component: () => import('@/views/editPwd/index'),
        meta: { title: '修改密码' ,icon: 'el-icon-lock'},
      },
    ]
  },

  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
