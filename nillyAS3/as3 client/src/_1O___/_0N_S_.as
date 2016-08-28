package _1O___
{
   import _0sm._0H_i;
   import _0sm._00n;
   import _0sm._S___;
   import _0sm._qE_;
   import _0sm._L_N_;
   import _0sb._1it;
   
   public class _0N_S_
   {
       
      
      [Inject]
      public var register:_0H_i;
      
      [Inject]
      public var _set_:_00n;
      
      [Inject]
      public var _T_T_:_S___;
      
      [Inject]
      public var _0cE_:_qE_;
      
      [Inject]
      public var _a2:_L_N_;
      
      public function _0N_S_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1it = null;
         _loc1_ = new _1it();
         _loc1_.name = "list";
         _loc1_.description = "lists available console commands";
         var _loc2_:_1it = new _1it();
         _loc2_.name = "clear";
         _loc2_.description = "clears the console";
         var _loc3_:_1it = new _1it();
         _loc3_.name = "exit";
         _loc3_.description = "closes the console";
         var _loc4_:_1it = new _1it();
         _loc4_.name = "copy";
         _loc4_.description = "copies the contents of the console to the clipboard";
         this.register.dispatch(_loc1_,this._set_);
         this.register.dispatch(_loc2_,this._T_T_);
         this.register.dispatch(_loc3_,this._0cE_);
         this.register.dispatch(_loc4_,this._a2);
      }
   }
}
