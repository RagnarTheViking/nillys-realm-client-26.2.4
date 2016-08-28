package _1cm
{
   import ToolTips.ToolTip;
   import _04h._083;
   import _1gF_._I_a;
   import com.company.assembleegameclient.ui.GuildDisplay;
   import flash.display.Bitmap;
   import _1xa.SText;
   import _1O_n._0E_l;
   
   public class _0uw extends ToolTip
   {
       
      
      public function _0uw(param1:_083)
      {
         var _loc2_:_I_a = null;
         var _loc3_:GuildDisplay = null;
         var _loc4_:Bitmap = new Bitmap();
         _loc4_.bitmapData = param1._each;
         _loc4_.scaleX = 0.75;
         _loc4_.scaleY = 0.75;
         _loc4_.y = 5;
         addChild(_loc4_);
         _loc2_ = new _I_a();
         _loc2_.setSize(14).setBold(true).setColor(16777215);
         _loc2_.setStringBuilder(new SText(param1.name));
         _loc2_.x = 40;
         _loc2_.y = 5;
         addChild(_loc2_);
         if(param1.guildName)
         {
            _loc3_ = new GuildDisplay(param1.guildName,param1._17I_);
            _loc3_.x = 40;
            _loc3_.y = 20;
            addChild(_loc3_);
         }
         super(3552822,0.5,16777215,1);
         var _loc5_:_0E_l = new _0E_l(null,param1._bT_,null);
         _loc5_.x = 5;
         _loc5_.y = !!_loc3_?Number(_loc3_.y + _loc3_.height - 5):Number(55);
         _loc5_.setItems(param1._W_V_);
         addChild(_loc5_);
      }
   }
}
