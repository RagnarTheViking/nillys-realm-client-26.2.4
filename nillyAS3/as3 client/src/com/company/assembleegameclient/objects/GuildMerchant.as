package com.company.assembleegameclient.objects
{
   import ToolTips.ToolTip;
   import ToolTips._0bd;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.Currency;
   import com.company.assembleegameclient.util.GuildUtil;
   
   public class GuildMerchant extends SellableObject implements _1kF_
   {
       
      
      public var description_:String;
      
      public function GuildMerchant(param1:XML)
      {
         super(param1);
         price_ = int(param1.Price);
         currency_ = Currency.GUILD_FAME;
         this.description_ = param1.Description;
         _0Q_V_ = GuildUtil._0iC_;
      }
      
      override public function soldObjectName() : String
      {
         return ObjectLibrary._O_S_[objectType_];
      }
      
      override public function soldObjectInternalName() : String
      {
         var _loc1_:XML = ObjectLibrary.XmlData[objectType_];
         return _loc1_.@id.toString();
      }
      
      override public function getTooltip() : ToolTip
      {
         return new _0bd(3552822,10197915,this.soldObjectName(),this.description_,200);
      }
      
      override public function getIcon() : BitmapData
      {
         return ObjectLibrary.getRedrawnTextureFromType(objectType_,80,true);
      }
   }
}
