package _0E_n
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class _1h1 extends Sprite
   {
      
      private static const _wX_:String = "<p align=\"center\"><font color=\"#FFFFFF\">Play at: " + "<br/></font><font color=\"#7777EE\">" + "<a href=\"http://www.realmofthemadgod.com/\">" + "www.realmofthemadgod.com</font></a></p>";
       
      
      public function _1h1()
      {
         super();
         var _loc1_:TextField = new TextField();
         _loc1_.selectable = false;
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.size = 20;
         _loc1_.defaultTextFormat = _loc2_;
         _loc1_.htmlText = _wX_;
         _loc1_.width = 800;
         _loc1_.y = 600 / 2 - _loc1_.height / 2;
         addChild(_loc1_);
      }
   }
}
