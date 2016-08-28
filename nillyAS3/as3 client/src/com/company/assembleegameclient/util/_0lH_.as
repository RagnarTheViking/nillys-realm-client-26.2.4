package com.company.assembleegameclient.util
{
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.offer.Offer;
   import _0H_6.GameContext;
   import _4u.Account;
   import _2l.ClientSettings;
   import flash.net.URLVariables;
   
   public class _0lH_
   {
      
      public static const _7G_:com.company.assembleegameclient.util._0lH_ = new com.company.assembleegameclient.util._0lH_(_1O_I_._p8,"co","");
      
      public static const _13B_:com.company.assembleegameclient.util._0lH_ = new com.company.assembleegameclient.util._0lH_(_1O_I_._yo,"ps","P3");
      
      public static const _03u:com.company.assembleegameclient.util._0lH_ = new com.company.assembleegameclient.util._0lH_(_1O_I_._Q_Y_,"ps","CH");
      
      public static const _096:Vector.<com.company.assembleegameclient.util._0lH_> = new <com.company.assembleegameclient.util._0lH_>[_7G_,_13B_,_03u];
       
      
      public var label_:String;
      
      public var _0B_Y_:String;
      
      public var _1X_h:String;
      
      public function _0lH_(param1:String, param2:String, param3:String)
      {
         super();
         this.label_ = param1;
         this._0B_Y_ = param2;
         this._1X_h = param3;
      }
      
      public static function _0W_J_(param1:String) : com.company.assembleegameclient.util._0lH_
      {
         var _loc2_:com.company.assembleegameclient.util._0lH_ = null;
         for each(_loc2_ in _096)
         {
            if(_loc2_.label_ == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function _1i4(param1:String, param2:String, param3:Offer) : String
      {
         var _loc4_:Account = GameContext.getInjector().getInstance(Account);
         var _loc5_:ClientSettings = GameContext.getInjector().getInstance(ClientSettings);
         var _loc6_:URLVariables = new URLVariables();
         _loc6_["tok"] = param1;
         _loc6_["exp"] = param2;
         _loc6_["guid"] = _loc4_.getUserId();
         _loc6_["provider"] = this._0B_Y_;
         switch(this._0B_Y_)
         {
            case "co":
               _loc6_["jwt"] = param3.jwt_;
               break;
            case "ps":
               _loc6_["jwt"] = param3.jwt_;
               _loc6_["price"] = param3.price_.toString();
               _loc6_["paymentid"] = this._1X_h;
         }
         return _loc5_.HttpServerAddress(true) + "/credits/add?" + _loc6_.toString();
      }
   }
}
