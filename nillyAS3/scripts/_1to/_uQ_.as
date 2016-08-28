package _1to
{
   import _0E_T_._1zi;
   import _1__8._19A_;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import _0E_T_._1G_k;
   
   public class _uQ_
   {
       
      
      [Inject]
      public var data:XML;
      
      [Inject]
      public var model:_1zi;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _uQ_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._E_q();
         this._12H_();
         this._1iw();
      }
      
      private function _E_q() : void
      {
         var _loc1_:XML = null;
         var _loc2_:_0ih = null;
         var _loc3_:XMLList = this.data.MaxClassLevelList.MaxClassLevel;
         for each(_loc1_ in _loc3_)
         {
            _loc2_ = this.model._0B_M_(_loc1_.@classType);
            _loc2_._0Q_s(_loc1_.@maxLevel);
         }
      }
      
      private function _12H_() : void
      {
         var _loc1_:XML = null;
         var _loc2_:_Y_F_ = null;
         var _loc3_:XMLList = this.data.ItemCosts.ItemCost;
         for each(_loc1_ in _loc3_)
         {
            _loc2_ = this.model._13e(_loc1_.@type);
            if(_loc2_)
            {
               _loc2_.cost = int(_loc1_);
               _loc2_.limited = Boolean(int(_loc1_.@expires));
               if(!Boolean(int(_loc1_.@purchasable)))
               {
                  _loc2_.setState(_1G_k.UNLISTED);
               }
            }
            else
            {
               this._0G_2._0G_b("Cannot set Character Skin cost: type {0} not found",[_loc1_.@type]);
            }
         }
      }
      
      private function _1iw() : void
      {
         var _loc1_:int = 0;
         var _loc2_:_Y_F_ = null;
         var _loc3_:Array = !!this.data.OwnedSkins.length()?this.data.OwnedSkins.split(","):[];
         for each(_loc1_ in _loc3_)
         {
            _loc2_ = this.model._13e(_loc1_);
            if(_loc2_)
            {
               _loc2_.setState(_1G_k.OWNED);
            }
            else
            {
               this._0G_2._0G_b("Cannot set Character Skin ownership: type {0} not found",[_loc1_]);
            }
         }
      }
   }
}
