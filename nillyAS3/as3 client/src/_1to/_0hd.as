package _1to
{
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _0E_T_._1zi;
   import kabam.rotmg.assets.EmbeddedData;
   import _0E_T_._Y_F_;
   import kabam.rotmg.assets.model._0V_v;
   import _0E_T_._0ih;
   
   public class _0hd
   {
       
      
      [Inject]
      public var data:XML;
      
      [Inject]
      public var model:_1zi;
      
      public function _0hd()
      {
         super();
      }
      
      private static function _B_s(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = param1.children();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.attribute("skinType").length() != 0)
            {
               _loc4_ = int(_loc3_.@skinType);
               _loc5_ = 16766720;
               if(_loc3_.attribute("color").length() != 0)
               {
                  _loc5_ = int(_loc3_.@color);
               }
               ObjectLibrary.EquipmentSetSkin[_loc4_] = _loc3_;
            }
         }
      }
      
      public function execute() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XMLList = null;
         var _loc3_:XML = null;
         var _loc4_:String = null;
         _loc1_ = EmbeddedData.Skins;
         _loc2_ = _loc1_.children();
         for each(_loc3_ in _loc2_)
         {
            this._T_(_loc3_);
         }
         _loc1_ = EmbeddedData.EquipmentSets;
         _loc2_ = _loc1_.children();
         for each(_loc3_ in _loc2_)
         {
            _B_s(_loc3_);
         }
         _loc4_ = this.data.SkinsList;
         _loc2_ = XML(_loc4_).elements("Object");
         for each(_loc3_ in _loc2_)
         {
            this._T_(_loc3_);
         }
         _loc2_ = XML(_loc4_).elements("EquipmentSet");
         for each(_loc3_ in _loc2_)
         {
            _B_s(_loc3_);
         }
      }
      
      private function _T_(param1:XML) : void
      {
         var _loc2_:String = param1.AnimatedTexture.File;
         var _loc3_:int = param1.AnimatedTexture.Index;
         var _loc4_:_Y_F_ = new _Y_F_();
         if(param1.hasOwnProperty("RemoteTexture"))
         {
            ObjectLibrary.add(param1);
            _loc3_ = param1.@type;
         }
         _loc4_.id = param1.@type;
         _loc4_.name = param1.DisplayId;
         _loc4_.unlockLevel = param1.UnlockLevel;
         if(param1.hasOwnProperty("NoSkinSelect"))
         {
            _loc4_.skinSelectable = false;
         }
         if(param1.hasOwnProperty("UnlockSpecial"))
         {
            _loc4_._0p7 = param1.UnlockSpecial;
         }
         _loc4_._0C_3 = new _0V_v(_loc2_,_loc3_);
         var _loc5_:_0ih = this.model._0B_M_(param1.PlayerClassType);
         _loc5_._E_G_._07z(_loc4_);
      }
   }
}
