package Market
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui.Button;
   import _1xa.SText;
   import _0xn._1uk;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class MarketNPCPanel extends Panel
   {
       
      
      private const _1N_S_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private var icon:Bitmap;
      
      var _0R_w:Button;
      
      var _0J___:Button;
      
      private var _title:String = "Marketplace";
      
      private var _sell:String = "Info";
      
      private var _manage:String = "Manage";
      
      var type:uint;
      
      public function MarketNPCPanel(param1:GameSprite, param2:uint)
      {
         this.type = param2;
         super(param1);
      }
      
      private function _0Y_I_() : void
      {
         this._0R_w = new Button(16,this._sell,0,true);
         this._0R_w.textChanged.addOnce(this._17U_);
         addChild(this._0R_w);
      }
      
      private function _A_v() : void
      {
         this.icon.x = 16;
         this.icon.y = -2;
         this._1N_S_.setStringBuilder(new SText(this._title));
         this._1N_S_.x = 69;
         this._1N_S_.y = 28;
         addChild(this._1N_S_);
      }
      
      private function _1Q_D_() : void
      {
         this._0J___ = new Button(16,this._manage,0,true);
         this._0J___.textChanged.addOnce(this._17U_);
         addChild(this._0J___);
      }
      
      public function init() : void
      {
         this._1e8();
         this._A_v();
         this._0Y_I_();
         this._1Q_D_();
      }
      
      private function _1e8() : void
      {
         this.icon = _1uk._q2(this.type);
         this.icon.scaleX = 0.5;
         this.icon.scaleY = 0.5;
         addChild(this.icon);
         this.icon.x = 5;
      }
      
      private function _17U_() : void
      {
         if(this._0J___ && contains(this._0J___))
         {
            this._0J___.x = WIDTH / 4 * 3 - this._0J___.width / 2;
            this._0J___.y = HEIGHT - this._0J___.height - 4;
            this._0R_w.x = WIDTH / 4 * 1 - this._0R_w.width / 2;
            this._0R_w.y = HEIGHT - this._0R_w.height - 4;
         }
         else
         {
            this._0R_w.x = (WIDTH - this._0R_w.width) / 2;
            this._0R_w.y = HEIGHT - this._0R_w.height - 4;
         }
      }
   }
}
