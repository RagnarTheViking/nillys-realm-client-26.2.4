package _0E_T_
{
   import _f7.Signal;
   
   public class _1zi
   {
      
      public static const _14L_:int = 782;
       
      
      public const selected:Signal = new Signal(_0E_T_._0ih);
      
      private const map:Object = {};
      
      private const classes:Vector.<_0E_T_._0ih> = new Vector.<_0E_T_._0ih>(0);
      
      private var count:uint = 0;
      
      private var _1A_1:_0E_T_._0ih;
      
      public function _1zi()
      {
         super();
      }
      
      public function _0iF_() : uint
      {
         return this.count;
      }
      
      public function _0K_B_(param1:int) : _0E_T_._0ih
      {
         return this.classes[param1];
      }
      
      public function _0B_M_(param1:int) : _0E_T_._0ih
      {
         return this.map[param1] = this.map[param1] || this._1ry();
      }
      
      private function _1ry() : _0E_T_._0ih
      {
         var _loc1_:_0E_T_._0ih = new _0E_T_._0ih();
         _loc1_.selected.add(this._1C_J_);
         this.count = this.classes.push(_loc1_);
         return _loc1_;
      }
      
      private function _1C_J_(param1:_0E_T_._0ih) : void
      {
         if(this._1A_1 != param1)
         {
            this._1A_1 && this._1A_1._u5(false);
            this._1A_1 = param1;
            this.selected.dispatch(param1);
         }
      }
      
      public function _1H_j() : _0E_T_._0ih
      {
         return this._1A_1 || this._0B_M_(_14L_);
      }
      
      public function _13e(param1:int) : _Y_F_
      {
         var _loc2_:_Y_F_ = null;
         var _loc3_:_0E_T_._0ih = null;
         for each(_loc3_ in this.classes)
         {
            _loc2_ = _loc3_._E_G_._nV_(param1);
            if(_loc2_ != _loc3_._E_G_._1sW_())
            {
               break;
            }
         }
         return _loc2_;
      }
   }
}
