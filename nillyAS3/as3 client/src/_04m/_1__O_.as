package _04m
{
   import _v4.Client;
   import _0E_T_._1zi;
   import kabam.rotmg.assets.services._0pW_;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import com.company.util.ConversionUtil;
   
   public class _1__O_
   {
       
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _0ta:_1zi;
      
      [Inject]
      public var factory:_0pW_;
      
      private var _0D_g:String;
      
      private var legends:Vector.<_04m._0dn>;
      
      public function _1__O_()
      {
         super();
      }
      
      public function _0X_7(param1:XML) : Vector.<_04m._0dn>
      {
         this._0D_g = this._0U_H_.getAccountId();
         this.legends = new Vector.<_04m._0dn>(0);
         this._1ah(param1.FameListElem,false);
         this._1ah(param1.MyFameListElem,true);
         return this.legends;
      }
      
      private function _1ah(param1:XMLList, param2:Boolean) : void
      {
         var _loc3_:XML = null;
         var _loc4_:_04m._0dn = null;
         for each(_loc3_ in param1)
         {
            if(!this._1W_2(_loc3_))
            {
               _loc4_ = this._hG_(_loc3_);
               _loc4_._U_2 = _loc3_.@accountId == this._0D_g;
               _loc4_._16Z_ = param2;
               this.legends.push(_loc4_);
            }
         }
      }
      
      private function _1W_2(param1:XML) : Boolean
      {
         var _loc2_:_04m._0dn = null;
         for each(_loc2_ in this.legends)
         {
            if(_loc2_.accountId == param1.@accountId && _loc2_.charId == param1.@charId)
            {
               return true;
            }
         }
         return false;
      }
      
      public function _hG_(param1:XML) : _04m._0dn
      {
         var _loc2_:int = param1.ObjectType;
         var _loc3_:int = param1.Texture;
         var _loc4_:_0ih = this._0ta._0B_M_(_loc2_);
         var _loc5_:_Y_F_ = _loc4_._E_G_._nV_(_loc3_);
         var _loc6_:int = !!param1.hasOwnProperty("Tex1")?int(param1.Tex1):0;
         var _loc7_:int = !!param1.hasOwnProperty("Tex2")?int(param1.Tex2):0;
         var _loc8_:_04m._0dn = new _04m._0dn();
         _loc8_.accountId = param1.@accountId;
         _loc8_.charId = param1.@charId;
         _loc8_.name = param1.Name;
         _loc8_._1__h = param1.TotalFame;
         _loc8_.character = this.factory.makeIcon(_loc5_._0C_3,100,_loc6_,_loc7_);
         _loc8_._0fZ_ = _loc4_._bT_;
         _loc8_._W_V_ = ConversionUtil._1b5(param1.Equipment);
         return _loc8_;
      }
   }
}
