package com.cha102.diyla.shoppingcart;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCartVO, Integer> {

	void deleteByMemIdAndComNo(Integer memId, Integer comNo);

	void deleteByMemId(Integer memId);

	Optional<ShoppingCartVO> findByMemIdAndComNo(Integer memId, Integer comNo);

	List<ShoppingCartVO> findByMemId(Integer memId);
	//會員cart清單
	@Query(nativeQuery = true, value = "SELECT DISTINCT s.*,c.COM_NAME,c.COM_PRI,c.COM_Pic FROM commodity c JOIN shopping_cart_list s ON c.COM_NO=s.COM_NO WHERE MEM_ID = ?1")
	List<Object[]> getCartList(@Param("memId") Integer memId);
	//總金額
    @Query(nativeQuery = true, value = "SELECT SUM(c.COM_PRI * s.COM_AMOUNT) FROM shopping_cart_list s LEFT JOIN  commodity c ON s.COM_NO = c.COM_NO WHERE s.MEM_ID = ?1")
    Integer getTotalPrice(Integer memId);
    //總數量
    @Query(nativeQuery = true, value = "SELECT SUM(s.COM_AMOUNT) FROM shopping_cart_list s WHERE s.MEM_ID = ?1")
    Integer getTotalAmount(Integer memId);
    
    

}
