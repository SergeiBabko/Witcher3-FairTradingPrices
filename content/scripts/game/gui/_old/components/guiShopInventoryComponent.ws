/***********************************************************************/
/** 	© 2015 CD PROJEKT S.A. All rights reserved.
/** 	THE WITCHER® is a trademark of CD PROJEKT S. A.
/** 	The Witcher game is based on the prose of Andrzej Sapkowski.
/***********************************************************************/
class W3GuiShopInventoryComponent extends W3GuiBaseInventoryComponent
{
	protected function InvalidateItems( items : array<SItemUniqueId> )
	{
		
	}

	function SetInventoryFlashObjectForItem( item : SItemUniqueId, out flashObject : CScriptedFlashObject) : void
	{
		var isQuest	 : bool;
		var l_questTag	: string;
		
		super.SetInventoryFlashObjectForItem(item, flashObject);
		
		
		l_questTag = "";
		if(_inv.ItemHasTag(item, 'Quest'))
		{
			l_questTag = "Quest";
			isQuest = true;
		}
		
		if (_inv.ItemHasTag(item, 'QuestEP1'))
		{
			l_questTag = "QuestEP1";
			isQuest = true;
		}
		
		if (_inv.ItemHasTag(item, 'QuestEP2'))
		{
			l_questTag = "QuestEP2";
			isQuest = true;
		}
		
		flashObject.SetMemberFlashBool( "isQuest", isQuest );
		flashObject.SetMemberFlashBool( "isNew", false ); 
		flashObject.SetMemberFlashString( "questTag", l_questTag );
	}
	
	protected function GridPositionEnabled() : bool
	{
		return false;
	}
	
	
	protected function ShopHasInfiniteFunds() : bool
	{
		if (theGame.params.m_FTP.IsModEnabled() && theGame.params.m_FTP.ShopHasInfiniteFunds())
		{
			return true;
		}
		return _inv.GetFundsType() == EInventoryFunds_Unlimited;
	}


	// Buy from merchant
	public function GiveItem( itemId : SItemUniqueId, customer : W3GuiBaseInventoryComponent, optional quantity : int, optional out newItemID : SItemUniqueId ) : bool
	{
		var customerMoney : int;
		var itemPrice : int;
		var success : bool;
		var invItem : SInventoryItem;

		success = false;
		
		if( quantity < 1 )
		{
			quantity = 1;
		}

		customerMoney = customer._inv.GetMoney();

		invItem = _inv.GetItem( itemId );
		
		itemPrice = _inv.GetInventoryItemPriceModified( invItem, false ) * quantity;

		if (theGame.params.m_FTP.IsModEnabled())
		{
			itemPrice = theGame.params.m_FTP.GetFairItemPrice(customer._inv, invItem, _inv.GetItemName(itemId), itemPrice, false) * quantity;
		}
		
		if ( customerMoney >= itemPrice )
		{
			success = super.GiveItem( itemId, customer, quantity, newItemID );
			if ( success )
			{
				customer._inv.RemoveMoney( itemPrice );
				
				if ( !ShopHasInfiniteFunds() )
				{
					_inv.AddMoney( itemPrice );
				}
			}
		}
		return success;
	}
	
	// Sell to merchant
	public function ReceiveItem( itemId : SItemUniqueId, giver : W3GuiBaseInventoryComponent, optional quantity : int, optional out newItemID : SItemUniqueId ) : bool
	{
		var shopMoney : int;
		var itemCost : int;
		var success : bool;
		var invItem : SInventoryItem;

		shopMoney = _inv.GetMoney();

		invItem = giver._inv.GetItem( itemId );
		
		itemCost = _inv.GetInventoryItemPriceModified( invItem, true ) * quantity;

		success = false;

		if (theGame.params.m_FTP.IsModEnabled())
		{
			itemCost = theGame.params.m_FTP.GetFairItemPrice(giver._inv, invItem, giver._inv.GetItemName(itemId), itemCost, true) * quantity;
		}

		if ( itemCost >= 0 && ( shopMoney >= itemCost || ShopHasInfiniteFunds() ) )
		{
			success = super.ReceiveItem( itemId, giver, quantity, newItemID );
			if ( success )
			{
				if ( !ShopHasInfiniteFunds() )
				{
					_inv.RemoveMoney( itemCost );
				}
				giver._inv.AddMoney( itemCost );
			}
		}
		return success;
	}
	
	public function GetItemActionType( item : SItemUniqueId, optional bGetDefault : bool ) : EInventoryActionType
	{
		return IAT_Buy;
	}
	public function GetItemName(item : SItemUniqueId):name
	{
		return _inv.GetItemName(item);
	}
}


