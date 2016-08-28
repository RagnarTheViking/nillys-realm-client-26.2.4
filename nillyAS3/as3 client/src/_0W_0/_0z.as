package _0W_0
{
   import _v4.Client;
   import kabam.rotmg.assets.services._0pW_;
   import _0E_T_._1zi;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import kabam.rotmg.assets.model.Animation;
   
   public class _0z
   {
       
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var factory:_0pW_;
      
      [Inject]
      public var _0ta:_1zi;
      
      private var _0ve:SavedCharacter;
      
      private var _0d8:_0ih;
      
      private var skin:_Y_F_;
      
      private var tex2:int;
      
      private var tex1:int;
      
      public function _0z()
      {
         super();
      }
      
      public function make() : Animation
      {
         this._0ve = this._0U_H_.getCharacter(this._0U_H_._1U_H_);
         this._0d8 = !!this._0ve?this._jt():this._0pH_();
         this.skin = this._0d8._E_G_._0sr();
         this.tex1 = !!this._0ve?int(this._0ve.tex1()):0;
         this.tex2 = !!this._0ve?int(this._0ve.tex2()):0;
         return this.factory._1iy(this.skin._0C_3,100,this.tex1,this.tex2);
      }
      
      private function _0pH_() : _0ih
      {
         return this._0ta._1H_j();
      }
      
      private function _jt() : _0ih
      {
         return this._0ta._0B_M_(this._0ve.objectType());
      }
   }
}
