package _17B_
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui.Button;
   import _1xa._dU_;
   import _0xn._1uk;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class _0Q_e extends Panel
   {
       
      
      private const _1N_S_:SimpleText = _1uk._0M_n(16777215,16,true);
      
      private var icon:Bitmap;
      
      var _0R_w:Button;
      
      var _0J___:Button;
      
      private var title:String = "Pets.caretakerPanelTitle";
      
      private var _0V_b:String = "Pets.caretakerPanelButtonInfo";
      
      private var _1ub:String = "Pets.caretakerPanelButtonUpgrade";
      
      var type:uint;
      
      public function _0Q_e(param1:GameSprite, param2:uint)
      {
         this.type = param2;
         super(param1);
      }
      
      private function _0Y_I_() : void
      {
         this._0R_w = new Button(16,this._0V_b);
         this._0R_w.textChanged.addOnce(this._17U_);
         addChild(this._0R_w);
      }
      
      private function _A_v() : void
      {
         this.icon.x = -25;
         this.icon.y = -36;
         this._1N_S_.setStringBuilder(new _dU_().setParams(this.title));
         this._1N_S_.x = 48;
         this._1N_S_.y = 28;
         addChild(this._1N_S_);
      }
      
      private function _1Q_D_() : void
      {
         this._0J___ = new Button(16,this._1ub);
         this._0J___.textChanged.addOnce(this._17U_);
         addChild(this._0J___);
      }
      
      public function init(param1:Boolean) : void
      {
         this._1e8();
         this._A_v();
         this._0Y_I_();
         if(param1)
         {
            this._1Q_D_();
         }
      }
      
      private function _1e8() : void
      {
         this.icon = _1uk._q2(this.type);
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
