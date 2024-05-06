package com.platzi.platzi.market.persistence;

import com.platzi.platzi.market.domain.Purchase;
import com.platzi.platzi.market.domain.repository.PurchaseRepository;
import com.platzi.platzi.market.persistence.crud.ComprasCrudRepository;
import com.platzi.platzi.market.persistence.entity.Compra;
import com.platzi.platzi.market.persistence.mapper.PurchaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class CompraRepository implements PurchaseRepository {
    @Autowired
    private ComprasCrudRepository comprasCrudRepository;

    @Autowired
    private PurchaseMapper purchaseMapper;

    @Override
    public List<Purchase> getAll() {
        return purchaseMapper.toPurchases((List<Compra>) comprasCrudRepository.findAll());
    }

    @Override
    public Optional<List<Purchase>> getByClient(String clientId) {

        return comprasCrudRepository.findByIdCliente(clientId)
                .map(compras -> purchaseMapper.toPurchases(compras));
    }

    @Override
    public Purchase save(Purchase purchase) {
        Compra compra = purchaseMapper.toCompra(purchase);
        compra.getProductos().forEach(producto -> producto.setCompra(compra));

        return purchaseMapper.toPurchase(comprasCrudRepository.save(compra));
    }
}
