package _1U_P_
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.ui.Button;
   import _05g._1S_m;
   import _1xa._dU_;
   import _1pp._8u;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class ArenaQueryPanel extends Panel
   {
       
      
      private const _1N_S_:SimpleText = _8u._0M_n(16777215,16,true);
      
      private var icon:Bitmap;
      
      var _0R_w:Button;
      
      var _11d:Button;
      
      private var title:String = "ArenaQueryPanel.title";
      
      private var _0V_b:String = "Pets.caretakerPanelButtonInfo";
      
      private var _1ub:String = "ArenaQueryPanel.leaderboard";
      
      private var _01T_:_1S_m;
      
      var type:uint;
      
      public function ArenaQueryPanel(param1:GameSprite, param2:uint)
      {
         this._01T_ = new _1S_m();
         this.type = param2;
         super(param1);
         this._01T_.complete.addOnce(this._17U_);
         this._1e8();
         this._A_v();
         this._0Y_I_();
         this._0qA_();
      }
      
      private function _0Y_I_() : void
      {
         this._0R_w = new Button(16,this._0V_b);
         this._01T_.push(this._0R_w.textChanged);
         addChild(this._0R_w);
      }
      
      private function _A_v() : void
      {
         this._1N_S_.setStringBuilder(new _dU_().setParams(this.title));
         this._1N_S_.x = 65;
         this._1N_S_.y = 28;
         addChild(this._1N_S_);
      }
      
      private function _0qA_() : void
      {
         this._11d = new Button(16,this._1ub);
         this._01T_.push(this._11d.textChanged);
         addChild(this._11d);
      }
      
      private function _1e8() : void
      {
         this.icon = _8u._1lz(this.type);
         addChild(this.icon);
         this.icon.x = 5;
      }
      
      private function _17U_() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 15;
         var _loc2_:int = this._0R_w.width + _loc1_ + this._11d.width;
         this._0R_w.x = WIDTH / 2 - _loc2_ / 2;
         this._11d.x = this._0R_w.x + this._0R_w.width + _loc1_;
         this._11d.y = HEIGHT - this._11d.height - 4;
         this._0R_w.y = HEIGHT - this._0R_w.height - 4;
      }
   }
}
