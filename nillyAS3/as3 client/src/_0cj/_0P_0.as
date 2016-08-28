package _0cj
{
   import _0f._J_c;
   import flash.utils.Dictionary;
   import _0f._1iK_;
   import _0f._1F_b;
   import flash.display.DisplayObject;
   
   public class _0P_0 implements _J_c
   {
       
      
      private const _A_2:Array = [];
      
      private var _M_E_:Dictionary;
      
      private var _factory:_1iK_;
      
      public function _0P_0(param1:_1iK_)
      {
         this._M_E_ = new Dictionary(true);
         super();
         this._factory = param1;
      }
      
      public function _0N_x(param1:_1F_b) : void
      {
         var _loc2_:int = this._A_2.indexOf(param1);
         if(_loc2_ > -1)
         {
            return;
         }
         this._A_2.push(param1);
         this._bX_();
      }
      
      public function _rS_(param1:_1F_b) : void
      {
         var _loc2_:int = this._A_2.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this._A_2.splice(_loc2_,1);
         this._bX_();
      }
      
      public function _N_m(param1:DisplayObject, param2:Class) : void
      {
         var _loc3_:Array = this._1I_9(param1,param2);
         if(_loc3_)
         {
            this._factory._1iD_(param1,param2,_loc3_);
         }
      }
      
      public function _0cc(param1:Object, param2:Class) : void
      {
         var _loc3_:Array = this._1I_9(param1,param2);
         if(_loc3_)
         {
            this._factory._1iD_(param1,param2,_loc3_);
         }
      }
      
      private function _bX_() : void
      {
         this._M_E_ = new Dictionary(true);
      }
      
      private function _1I_9(param1:Object, param2:Class) : Array
      {
         var _loc3_:_1F_b = null;
         if(this._M_E_[param2] === false)
         {
            return null;
         }
         if(this._M_E_[param2] == undefined)
         {
            this._M_E_[param2] = false;
            for each(_loc3_ in this._A_2)
            {
               _loc3_._df();
               if(_loc3_._0az.matches(param1))
               {
                  this._M_E_[param2] = this._M_E_[param2] || [];
                  this._M_E_[param2].push(_loc3_);
               }
            }
            if(this._M_E_[param2] === false)
            {
               return null;
            }
         }
         return this._M_E_[param2] as Array;
      }
   }
}
